# 创建图片下载脚本
# 这个脚本将下载示例图片作为占位符

# 创建images目录（如果不存在）
if (-not (Test-Path -Path ".\images")) {
    New-Item -Path ".\images" -ItemType Directory
}

# 示例图片URL（这些是免费的图片，仅用于演示）
$imageUrls = @{
    "manor-library.jpg" = "https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=800&q=80"
    "manor-observatory.jpg" = "https://images.unsplash.com/photo-1543722530-d2c3201371e7?w=800&q=80"
    "manor-study.jpg" = "https://images.unsplash.com/photo-1524758631624-e2822e304c36?w=800&q=80"
    "manor-hallway.jpg" = "https://images.unsplash.com/photo-1505409859467-3a796fd5798e?w=800&q=80"
    "hero-bg.jpg" = "https://images.unsplash.com/photo-1518005068251-37900150dfca?w=1200&q=80"
}

# 下载每个图片
foreach ($image in $imageUrls.GetEnumerator()) {
    $imagePath = ".\images\$($image.Key)"
    Write-Host "正在下载 $($image.Key)..."
    
    try {
        Invoke-WebRequest -Uri $image.Value -OutFile $imagePath
        Write-Host "下载完成: $($image.Key)" -ForegroundColor Green
    }
    catch {
        Write-Host "下载失败: $($image.Key)" -ForegroundColor Red
        Write-Host $_.Exception.Message
    }
}

Write-Host "`n所有图片下载完成！" -ForegroundColor Cyan
Write-Host "这些是临时占位图片，请替换为游戏的实际截图。"
Write-Host "图片保存在 ./images/ 目录中" 