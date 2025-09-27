module.exports = {
  apps: [
    {
      name: "apbd_deb_backend --3000",
      script: "dist/index.js",
      env: {
        NODE_ENV: "development",
        PORT: 3000,
      },
      env_production: {
        NODE_ENV: "production",
        PORT:9000,
      },
    },
  ],
};