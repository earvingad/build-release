day=$(date +%F)
echo -n 9.0_b$day >release.tag && \
# sed -i "s/name: Build x-wrt.*/name: Build x-wrt-$day/g" .github/workflows/build-xwrt.yml && \
sed -i "s/9.0_b.*/9.0_b$day\"/" .configx && \
git add . && \
git commit --signoff -am "release: $day" && \
git push origin master || exit 1
