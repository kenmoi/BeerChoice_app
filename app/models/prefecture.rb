class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, pref_name: '北海道' }, { id: 2, pref_name: '青森県' }, { id: 3, pref_name: '岩手県' },
    { id: 4, pref_name: '宮城県' }, { id: 5, pref_name: '秋田県' }, { id: 6, pref_name: '山形県' },
    { id: 7, pref_name: '福島県' }, { id: 8, pref_name: '茨城県' }, { id: 9, pref_name: '栃木県' },
    { id: 10, pref_name: '群馬県' }, { id: 11, pref_name: '埼玉県' }, { id: 12, pref_name: '千葉県' },
    { id: 13, pref_name: '東京都' }, { id: 14, pref_name: '神奈川県' }, { id: 15, pref_name: '新潟県' },
    { id: 16, pref_name: '富山県' }, { id: 17, pref_name: '石川県' }, { id: 18, pref_name: '福井県' },
    { id: 19, pref_name: '山梨県' }, { id: 20, pref_name: '長野県' }, { id: 21, pref_name: '岐阜県' },
    { id: 22, pref_name: '静岡県' }, { id: 23, pref_name: '愛知県' }, { id: 24, pref_name: '三重県' },
    { id: 25, pref_name: '滋賀県' }, { id: 26, pref_name: '京都府' }, { id: 27, pref_name: '大阪府' },
    { id: 28, pref_name: '兵庫県' }, { id: 29, pref_name: '奈良県' }, { id: 30, pref_name: '和歌山県' },
    { id: 31, pref_name: '鳥取県' }, { id: 32, pref_name: '島根県' }, { id: 33, pref_name: '岡山県' },
    { id: 34, pref_name: '広島県' }, { id: 35, pref_name: '山口県' }, { id: 36, pref_name: '徳島県' },
    { id: 37, pref_name: '香川県' }, { id: 38, pref_name: '愛媛県' }, { id: 39, pref_name: '高知県' },
    { id: 40, pref_name: '福岡県' }, { id: 41, pref_name: '佐賀県' }, { id: 42, pref_name: '長崎県' },
    { id: 43, pref_name: '熊本県' }, { id: 44, pref_name: '大分県' }, { id: 45, pref_name: '宮崎県' },
    { id: 46, pref_name: '鹿児島県' }, { id: 47, pref_name: '沖縄県' }
  ]
end
