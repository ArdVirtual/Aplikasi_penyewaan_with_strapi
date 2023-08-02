'use strict';

/**
 * outdoor service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::outdoor.outdoor');
