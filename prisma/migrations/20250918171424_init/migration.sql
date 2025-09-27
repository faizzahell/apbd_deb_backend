-- CreateEnum
CREATE TYPE "RoleUser" AS ENUM ('admin', 'lecturer', 'student');

-- CreateEnum
CREATE TYPE "StatusUser" AS ENUM ('online', 'offline');

-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "avatar" TEXT,
    "role" "RoleUser" NOT NULL DEFAULT 'student',
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogActivityUser" (
    "id" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "status" "StatusUser" NOT NULL DEFAULT 'offline',
    "timeLogin" TIMESTAMP(3),
    "timeLogout" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogActivityUser_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "LogActivityUser_userId_key" ON "LogActivityUser"("userId");

-- AddForeignKey
ALTER TABLE "LogActivityUser" ADD CONSTRAINT "LogActivityUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
