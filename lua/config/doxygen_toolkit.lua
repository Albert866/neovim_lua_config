-- Doxygen Toolkit configuration
-- Dox to generate doxygen comment,
-- Dox! to update doxygen comment,
-- DoxLic to generate license comment,
-- DoxAuthor to generate author comment

vim.g.DoxygenToolkit_commentType = "C++"
vim.g.DoxygenToolkit_briefTag_funcName="yes"
vim.g.doxygen_enhanced_color=1

vim.g.DoxygenToolkit_authorName = "Albert"

vim.g.DoxygenToolkit_licenseBrief = "Apache License 2.0"
vim.g.DoxygenToolkit_licenseTag = table.concat({
    '',
    '    Copyright (c) 2021-2022 Project CHIP Authors',
    '    Copyright (c) 2022 OpenSources LLC.',
    '    All rights reserved.',
    '',
    '    Licensed under the Apache License, Version 2.0 (the "License");',
    '    you may not use this file except in compliance with the License.',
    '    You may obtain a copy of the License at',
    '',
    '        http://www.apache.org/licenses/LICENSE-2.0',
    '',
    '    Unless required by applicable law or agreed to in writing, software',
    '    distributed under the License is distributed on an "AS IS" BASIS,',
    '    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.',
    '    See the License for the specific language governing permissions and',
    '    limitations under the License.',
}, '\r')
