Config = {}

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

--If source is 'web', then pageName should be the entire URL of the image 
--path. ex, https://upload.wikimedia.org/wikipedia/commons/b/b5/800x600_Wallpaper_Blue_Sky.png

Config.Books = {
    ['tourism_guide'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
            { pageName = "1", type = 'hard', source = 'local' }, --Inside Front Cover
            { pageName = "2", type = 'normal', source = 'local' }, --Page 2
            { pageName = "3", type = 'normal', source = 'local' }, --Page 2
            { pageName = "4", type = 'normal', source = 'local' }, --Page 3
            { pageName = "5", type = 'normal', source = 'local' }, --Page 3
            { pageName = "6", type = 'hard', source = 'local' }, --Inside Rear Cover
            { pageName = "backcover", type = 'hard', source = 'local' }, --Rear Cover
        },
        ['prop'] = 'book', --ex. book, map
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },
    },
    ['pacific_blueprints'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
            { pageName = "1", type = 'hard', source = 'local' }, --Inside Front Cover
            { pageName = "2", type = 'normal', source = 'local' }, --Page 2
            { pageName = "3", type = 'normal', source = 'local' }, --Page 2
            { pageName = "4", type = 'hard', source = 'local' }, --Inside Rear Cover
            { pageName = "backcover", type = 'hard', source = 'local' }, --Rear Cover
        },
        ['prop'] = 'book', --ex. book, map
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },
    },
}