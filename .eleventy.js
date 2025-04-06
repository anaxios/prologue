const { DateTime } = require("luxon");

const TIME_ZONE = "America/Chicago";

module.exports = (eleventyConfig) => {
  eleventyConfig.addPassthroughCopy("src/css");
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

  eleventyConfig.addFilter("shorten", function (str, count) {
    return str.split(" ", count || 15).join(" ");
  });

  eleventyConfig.addFilter("dateHuge", function (str) {
    return DateTime.local(str).toLocaleString(DateTime.DATETIME_HUGE);
  });

  eleventyConfig.addFilter("prologueUrlToMonthDate", function (str) {
    const temp = str.split("-").slice(-2);
    const month = temp[0].charAt(0).toUpperCase() + temp[0].slice(1);
    const date = temp[1].replace("/", "");
    return `${month} ${date}`;
  });

  eleventyConfig.addFilter("prologueSort", function (str) {
    return str.sort(function (a, b) {
      return a.url.slice(16, 19) - b.url.slice(16, 19);
    });
  });

  eleventyConfig.addFilter("monthDateToDate", function (str) {
    return DateTime.fromFormat(str, "MMMM d");
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
