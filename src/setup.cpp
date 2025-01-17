/*
 * Copyright (C) 2025 LingmoOS Team.
 *
 * Author:     Lingmo OS Team <team@lingmo.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include "setup.h"
#include <QSettings>
#include <QProcess>

FirstSetupUI::FirstSetupUI(QObject *parent)
    : QObject(parent)
{
}

void FirstSetupUI::configInstall()
{
    QProcess::startDetached("config-installer", QStringList());
}