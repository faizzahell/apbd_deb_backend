module.exports = {
  apps: [
    {
      name: "apbd_deb_sv_ugm_backend --9001",
      script: "src/index.ts",
      env: {
        NODE_ENV: "development",
        PORT: 3001,
      },
      env_production: {
        NODE_ENV: "production",
        PORT:9001,
      },
    },
  ],
};