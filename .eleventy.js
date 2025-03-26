const { DateTime } = require("luxon");

const TIME_ZONE = "America/Chicago";

module.exports = (eleventyConfig) => {
  eleventyConfig.addPassthroughCopy("src/styles.css");
  eleventyConfig.addPassthroughCopy("src/assets");

  eleventyConfig.addDateParsing(function (dateValue) {
    let localDate;
    if (dateValue instanceof Date) {
      // and YAML
      localDate = DateTime.fromJSDate(dateValue, { zone: "utc" }).setZone(
        TIME_ZONE,
        { keepLocalTime: true }
      );
    } else if (typeof dateValue === "string") {
      localDate = DateTime.fromISO(dateValue, { zone: TIME_ZONE });
    }
    if (localDate?.isValid === false) {
      throw new Error(
        `Invalid \`date\` value (${dateValue}) is invalid for ${this.page.inputPath}: ${localDate.invalidReason}`
      );
    }
    return localDate;
  });

  return {
    markdownTemplateEngine: "njk",
    dataTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
    dir: {
      input: "src",
      output: "dist",
    },
  };
};
