#!/bin/bash

# ✅ Чек-лист активации GitHub Pages
# Пошаговая проверка перед деплоем

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ✅ Чек-лист GitHub Pages                                  ║"
echo "║  Проверка перед активацией                                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo "📋 ПРОВЕРКА 1: Git репозиторий"
if [ -d ".git" ]; then
    echo "   ✅ Git инициализирован"
else
    echo "   ❌ Git НЕ инициализирован"
    echo "   Команда: git init"
    exit 1
fi
echo ""

echo "📋 ПРОВЕРКА 2: index.html"
if [ -f "index.html" ]; then
    echo "   ✅ index.html найден"
    lines=$(wc -l < index.html)
    size=$(du -h index.html | cut -f1)
    echo "   📊 Размер: $size, строк: $lines"
else
    echo "   ❌ index.html НЕ найден!"
    exit 1
fi
echo ""

echo "📋 ПРОВЕРКА 3: Стили и скрипты"
if [ -f "styles/main.css" ]; then
    echo "   ✅ styles/main.css найден"
else
    echo "   ⚠️  styles/main.css НЕ найден"
fi

if [ -f "scripts/main.js" ]; then
    echo "   ✅ scripts/main.js найден"
else
    echo "   ⚠️  scripts/main.js НЕ найден"
fi
echo ""

echo "📋 ПРОВЕРКА 4: .nojekyll файл"
if [ -f ".nojekyll" ]; then
    echo "   ✅ .nojekyll найден (Jekyll отключен)"
else
    echo "   ⚠️  .nojekyll НЕ найден (создам)"
    touch .nojekyll
fi
echo ""

echo "📋 ПРОВЕРКА 5: .gitignore"
if [ -f ".gitignore" ]; then
    echo "   ✅ .gitignore найден"
else
    echo "   ⚠️  .gitignore НЕ найден (создам)"
    cat > .gitignore << 'EOF'
node_modules/
.DS_Store
*.log
*.swp
.env
dist/
build/
EOF
    echo "   ✅ Создан .gitignore"
fi
echo ""

echo "📋 ПРОВЕРКА 6: Git remote"
if git remote get-url origin > /dev/null 2>&1; then
    remote=$(git remote get-url origin)
    echo "   ✅ Git remote установлен: $remote"
else
    echo "   ❌ Git remote НЕ установлен!"
    echo "   Команда: git remote add origin https://github.com/diasaliyev21-sudo/my-site.git"
    exit 1
fi
echo ""

echo "📋 ПРОВЕРКА 7: Статус репозитория"
if git status > /dev/null 2>&1; then
    echo "   ✅ Репозиторий инициализирован"
    branch=$(git rev-parse --abbrev-ref HEAD)
    echo "   📍 Текущий branch: $branch"
else
    echo "   ❌ Ошибка в репозитории!"
    exit 1
fi
echo ""

echo "📋 ПРОВЕРКА 8: Размер проекта"
total_size=$(du -sh . | cut -f1)
echo "   📊 Размер проекта: $total_size"
if [ "$total_size" -gt "100M" ]; then
    echo "   ⚠️  Проект больше 100MB (может быть медленным)"
else
    echo "   ✅ Размер оптимален"
fi
echo ""

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🎉 Все проверки пройдены!                                 ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo "🚀 Следующие шаги:"
echo ""
echo "1️⃣  Откройте Settings на GitHub:"
echo "    https://github.com/diasaliyev21-sudo/my-site/settings"
echo ""
echo "2️⃣  Найдите секцию 'Pages' слева"
echo ""
echo "3️⃣  Выберите:"
echo "    Source: Deploy from a branch"
echo "    Branch: main"
echo "    Folder: /"
echo ""
echo "4️⃣  Нажмите Save"
echo ""
echo "5️⃣  Подождите 1-2 минуты"
echo ""
echo "6️⃣  Откройте: https://diasaliyev21-sudo.github.io"
echo ""

echo "📱 Результат:"
echo "   Ваш сайт будет доступен по адресу:"
echo "   🌐 https://diasaliyev21-sudo.github.io"
echo ""

read -p "Нажмите Enter для завершения..."
