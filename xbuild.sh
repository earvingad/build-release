day=$(date +%F)
echo -n 21.10_b$day >release.tag && \
# sed -i "s/name: Build x-wrt.*/name: Build x-wrt-$day/g" .github/workflows/build-xwrt.yml && \
sed -i "s/21.10_b.*/21.10_b$day\"/" .configx && \
git add . && \
git commit -m "release: $day" && \
git push origin master || exit 1
