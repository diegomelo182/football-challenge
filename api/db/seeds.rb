logger = Rails.logger

puts 'Seeding Nationality table...'

ActiveRecord::Base.transaction do
  Nationality.where({ name: 'Andorra' }).first_or_create
  Nationality.where({ name: 'United Arab Emirates' }).first_or_create
  Nationality.where({ name: 'Afghanistan' }).first_or_create
  Nationality.where({ name: 'Antigua and Barbuda' }).first_or_create
  Nationality.where({ name: 'Anguilla' }).first_or_create
  Nationality.where({ name: 'Albania' }).first_or_create
  Nationality.where({ name: 'Armenia' }).first_or_create
  Nationality.where({ name: 'Angola' }).first_or_create
  Nationality.where({ name: 'Antarctica' }).first_or_create
  Nationality.where({ name: 'Argentina' }).first_or_create
  Nationality.where({ name: 'American Samoa' }).first_or_create
  Nationality.where({ name: 'Austria' }).first_or_create
  Nationality.where({ name: 'Australia' }).first_or_create
  Nationality.where({ name: 'Aruba' }).first_or_create
  Nationality.where({ name: 'Aland Islands' }).first_or_create
  Nationality.where({ name: 'Azerbaijan' }).first_or_create
  Nationality.where({ name: 'Bosnia and Herzegovina' }).first_or_create
  Nationality.where({ name: 'Barbados' }).first_or_create
  Nationality.where({ name: 'Bangladesh' }).first_or_create
  Nationality.where({ name: 'Belgium' }).first_or_create
  Nationality.where({ name: 'Burkina Faso' }).first_or_create
  Nationality.where({ name: 'Bulgaria' }).first_or_create
  Nationality.where({ name: 'Bahrain' }).first_or_create
  Nationality.where({ name: 'Burundi' }).first_or_create
  Nationality.where({ name: 'Benin' }).first_or_create
  Nationality.where({ name: 'Saint Barthelemy' }).first_or_create
  Nationality.where({ name: 'Bermuda' }).first_or_create
  Nationality.where({ name: 'Brunei' }).first_or_create
  Nationality.where({ name: 'Bolivia' }).first_or_create
  Nationality.where({ name: 'Bonaire, Saint Eustatius and Saba ' }).first_or_create
  Nationality.where({ name: 'Brazil' }).first_or_create
  Nationality.where({ name: 'Bahamas' }).first_or_create
  Nationality.where({ name: 'Bhutan' }).first_or_create
  Nationality.where({ name: 'Bouvet Island' }).first_or_create
  Nationality.where({ name: 'Botswana' }).first_or_create
  Nationality.where({ name: 'Belarus' }).first_or_create
  Nationality.where({ name: 'Belize' }).first_or_create
  Nationality.where({ name: 'Canada' }).first_or_create
  Nationality.where({ name: 'Cocos Islands' }).first_or_create
  Nationality.where({ name: 'Democratic Republic of the Congo' }).first_or_create
  Nationality.where({ name: 'Central African Republic' }).first_or_create
  Nationality.where({ name: 'Republic of the Congo' }).first_or_create
  Nationality.where({ name: 'Switzerland' }).first_or_create
  Nationality.where({ name: 'Ivory Coast' }).first_or_create
  Nationality.where({ name: 'Cook Islands' }).first_or_create
  Nationality.where({ name: 'Chile' }).first_or_create
  Nationality.where({ name: 'Cameroon' }).first_or_create
  Nationality.where({ name: 'China' }).first_or_create
  Nationality.where({ name: 'Colombia' }).first_or_create
  Nationality.where({ name: 'Costa Rica' }).first_or_create
  Nationality.where({ name: 'Cuba' }).first_or_create
  Nationality.where({ name: 'Cape Verde' }).first_or_create
  Nationality.where({ name: 'Curacao' }).first_or_create
  Nationality.where({ name: 'Christmas Island' }).first_or_create
  Nationality.where({ name: 'Cyprus' }).first_or_create
  Nationality.where({ name: 'Czech Republic' }).first_or_create
  Nationality.where({ name: 'Germany' }).first_or_create
  Nationality.where({ name: 'Djibouti' }).first_or_create
  Nationality.where({ name: 'Denmark' }).first_or_create
  Nationality.where({ name: 'Dominica' }).first_or_create
  Nationality.where({ name: 'Dominican Republic' }).first_or_create
  Nationality.where({ name: 'Algeria' }).first_or_create
  Nationality.where({ name: 'Ecuador' }).first_or_create
  Nationality.where({ name: 'Estonia' }).first_or_create
  Nationality.where({ name: 'Egypt' }).first_or_create
  Nationality.where({ name: 'Western Sahara' }).first_or_create
  Nationality.where({ name: 'Eritrea' }).first_or_create
  Nationality.where({ name: 'Spain' }).first_or_create
  Nationality.where({ name: 'Ethiopia' }).first_or_create
  Nationality.where({ name: 'Finland' }).first_or_create
  Nationality.where({ name: 'Fiji' }).first_or_create
  Nationality.where({ name: 'Falkland Islands' }).first_or_create
  Nationality.where({ name: 'Micronesia' }).first_or_create
  Nationality.where({ name: 'Faroe Islands' }).first_or_create
  Nationality.where({ name: 'France' }).first_or_create
  Nationality.where({ name: 'Gabon' }).first_or_create
  Nationality.where({ name: 'United Kingdom' }).first_or_create
  Nationality.where({ name: 'Grenada' }).first_or_create
  Nationality.where({ name: 'Georgia' }).first_or_create
  Nationality.where({ name: 'French Guiana' }).first_or_create
  Nationality.where({ name: 'Guernsey' }).first_or_create
  Nationality.where({ name: 'Ghana' }).first_or_create
  Nationality.where({ name: 'Gibraltar' }).first_or_create
  Nationality.where({ name: 'Greenland' }).first_or_create
  Nationality.where({ name: 'Gambia' }).first_or_create
  Nationality.where({ name: 'Guinea' }).first_or_create
  Nationality.where({ name: 'Guadeloupe' }).first_or_create
  Nationality.where({ name: 'Equatorial Guinea' }).first_or_create
  Nationality.where({ name: 'Greece' }).first_or_create
  Nationality.where({ name: 'South Georgia and the South Sandwich Islands' }).first_or_create
  Nationality.where({ name: 'Guatemala' }).first_or_create
  Nationality.where({ name: 'Guam' }).first_or_create
  Nationality.where({ name: 'Guinea-Bissau' }).first_or_create
  Nationality.where({ name: 'Guyana' }).first_or_create
  Nationality.where({ name: 'Hong Kong' }).first_or_create
  Nationality.where({ name: 'Heard Island and McDonald Islands' }).first_or_create
  Nationality.where({ name: 'Honduras' }).first_or_create
  Nationality.where({ name: 'Croatia' }).first_or_create
  Nationality.where({ name: 'Haiti' }).first_or_create
  Nationality.where({ name: 'Hungary' }).first_or_create
  Nationality.where({ name: 'Indonesia' }).first_or_create
  Nationality.where({ name: 'Ireland' }).first_or_create
  Nationality.where({ name: 'Israel' }).first_or_create
  Nationality.where({ name: 'Isle of Man' }).first_or_create
  Nationality.where({ name: 'India' }).first_or_create
  Nationality.where({ name: 'British Indian Ocean Territory' }).first_or_create
  Nationality.where({ name: 'Iraq' }).first_or_create
  Nationality.where({ name: 'Iran' }).first_or_create
  Nationality.where({ name: 'Iceland' }).first_or_create
  Nationality.where({ name: 'Italy' }).first_or_create
  Nationality.where({ name: 'Jersey' }).first_or_create
  Nationality.where({ name: 'Jamaica' }).first_or_create
  Nationality.where({ name: 'Jordan' }).first_or_create
  Nationality.where({ name: 'Japan' }).first_or_create
  Nationality.where({ name: 'Kenya' }).first_or_create
  Nationality.where({ name: 'Kyrgyzstan' }).first_or_create
  Nationality.where({ name: 'Cambodia' }).first_or_create
  Nationality.where({ name: 'Kiribati' }).first_or_create
  Nationality.where({ name: 'Comoros' }).first_or_create
  Nationality.where({ name: 'Saint Kitts and Nevis' }).first_or_create
  Nationality.where({ name: 'North Korea' }).first_or_create
  Nationality.where({ name: 'South Korea' }).first_or_create
  Nationality.where({ name: 'Kosovo' }).first_or_create
  Nationality.where({ name: 'Kuwait' }).first_or_create
  Nationality.where({ name: 'Cayman Islands' }).first_or_create
  Nationality.where({ name: 'Kazakhstan' }).first_or_create
  Nationality.where({ name: 'Laos' }).first_or_create
  Nationality.where({ name: 'Lebanon' }).first_or_create
  Nationality.where({ name: 'Saint Lucia' }).first_or_create
  Nationality.where({ name: 'Liechtenstein' }).first_or_create
  Nationality.where({ name: 'Sri Lanka' }).first_or_create
  Nationality.where({ name: 'Liberia' }).first_or_create
  Nationality.where({ name: 'Lesotho' }).first_or_create
  Nationality.where({ name: 'Lithuania' }).first_or_create
  Nationality.where({ name: 'Luxembourg' }).first_or_create
  Nationality.where({ name: 'Latvia' }).first_or_create
  Nationality.where({ name: 'Libya' }).first_or_create
  Nationality.where({ name: 'Morocco' }).first_or_create
  Nationality.where({ name: 'Monaco' }).first_or_create
  Nationality.where({ name: 'Moldova' }).first_or_create
  Nationality.where({ name: 'Montenegro' }).first_or_create
  Nationality.where({ name: 'Saint Martin' }).first_or_create
  Nationality.where({ name: 'Madagascar' }).first_or_create
  Nationality.where({ name: 'Marshall Islands' }).first_or_create
  Nationality.where({ name: 'Macedonia' }).first_or_create
  Nationality.where({ name: 'Mali' }).first_or_create
  Nationality.where({ name: 'Myanmar' }).first_or_create
  Nationality.where({ name: 'Mongolia' }).first_or_create
  Nationality.where({ name: 'Macao' }).first_or_create
  Nationality.where({ name: 'Northern Mariana Islands' }).first_or_create
  Nationality.where({ name: 'Martinique' }).first_or_create
  Nationality.where({ name: 'Mauritania' }).first_or_create
  Nationality.where({ name: 'Montserrat' }).first_or_create
  Nationality.where({ name: 'Malta' }).first_or_create
  Nationality.where({ name: 'Mauritius' }).first_or_create
  Nationality.where({ name: 'Maldives' }).first_or_create
  Nationality.where({ name: 'Malawi' }).first_or_create
  Nationality.where({ name: 'Mexico' }).first_or_create
  Nationality.where({ name: 'Malaysia' }).first_or_create
  Nationality.where({ name: 'Mozambique' }).first_or_create
  Nationality.where({ name: 'Namibia' }).first_or_create
  Nationality.where({ name: 'New Caledonia' }).first_or_create
  Nationality.where({ name: 'Niger' }).first_or_create
  Nationality.where({ name: 'Norfolk Island' }).first_or_create
  Nationality.where({ name: 'Nigeria' }).first_or_create
  Nationality.where({ name: 'Nicaragua' }).first_or_create
  Nationality.where({ name: 'Netherlands' }).first_or_create
  Nationality.where({ name: 'Norway' }).first_or_create
  Nationality.where({ name: 'Nepal' }).first_or_create
  Nationality.where({ name: 'Nauru' }).first_or_create
  Nationality.where({ name: 'Niue' }).first_or_create
  Nationality.where({ name: 'New Zealand' }).first_or_create
  Nationality.where({ name: 'Oman' }).first_or_create
  Nationality.where({ name: 'Panama' }).first_or_create
  Nationality.where({ name: 'Peru' }).first_or_create
  Nationality.where({ name: 'French Polynesia' }).first_or_create
  Nationality.where({ name: 'Papua New Guinea' }).first_or_create
  Nationality.where({ name: 'Philippines' }).first_or_create
  Nationality.where({ name: 'Pakistan' }).first_or_create
  Nationality.where({ name: 'Poland' }).first_or_create
  Nationality.where({ name: 'Saint Pierre and Miquelon' }).first_or_create
  Nationality.where({ name: 'Pitcairn' }).first_or_create
  Nationality.where({ name: 'Puerto Rico' }).first_or_create
  Nationality.where({ name: 'Palestinian Territory' }).first_or_create
  Nationality.where({ name: 'Portugal' }).first_or_create
  Nationality.where({ name: 'Palau' }).first_or_create
  Nationality.where({ name: 'Paraguay' }).first_or_create
  Nationality.where({ name: 'Qatar' }).first_or_create
  Nationality.where({ name: 'Reunion' }).first_or_create
  Nationality.where({ name: 'Romania' }).first_or_create
  Nationality.where({ name: 'Serbia' }).first_or_create
  Nationality.where({ name: 'Russia' }).first_or_create
  Nationality.where({ name: 'Rwanda' }).first_or_create
  Nationality.where({ name: 'Saudi Arabia' }).first_or_create
  Nationality.where({ name: 'Solomon Islands' }).first_or_create
  Nationality.where({ name: 'Seychelles' }).first_or_create
  Nationality.where({ name: 'Sudan' }).first_or_create
  Nationality.where({ name: 'Sweden' }).first_or_create
  Nationality.where({ name: 'Singapore' }).first_or_create
  Nationality.where({ name: 'Saint Helena' }).first_or_create
  Nationality.where({ name: 'Slovenia' }).first_or_create
  Nationality.where({ name: 'Svalbard and Jan Mayen' }).first_or_create
  Nationality.where({ name: 'Slovakia' }).first_or_create
  Nationality.where({ name: 'Sierra Leone' }).first_or_create
  Nationality.where({ name: 'San Marino' }).first_or_create
  Nationality.where({ name: 'Senegal' }).first_or_create
  Nationality.where({ name: 'Somalia' }).first_or_create
  Nationality.where({ name: 'Suriname' }).first_or_create
  Nationality.where({ name: 'Sao Tome and Principe' }).first_or_create
  Nationality.where({ name: 'El Salvador' }).first_or_create
  Nationality.where({ name: 'Sint Maarten' }).first_or_create
  Nationality.where({ name: 'Syria' }).first_or_create
  Nationality.where({ name: 'Swaziland' }).first_or_create
  Nationality.where({ name: 'Turks and Caicos Islands' }).first_or_create
  Nationality.where({ name: 'Chad' }).first_or_create
  Nationality.where({ name: 'French Southern Territories' }).first_or_create
  Nationality.where({ name: 'Togo' }).first_or_create
  Nationality.where({ name: 'Thailand' }).first_or_create
  Nationality.where({ name: 'Tajikistan' }).first_or_create
  Nationality.where({ name: 'Tokelau' }).first_or_create
  Nationality.where({ name: 'East Timor' }).first_or_create
  Nationality.where({ name: 'Turkmenistan' }).first_or_create
  Nationality.where({ name: 'Tunisia' }).first_or_create
  Nationality.where({ name: 'Tonga' }).first_or_create
  Nationality.where({ name: 'Turkey' }).first_or_create
  Nationality.where({ name: 'Trinidad and Tobago' }).first_or_create
  Nationality.where({ name: 'Tuvalu' }).first_or_create
  Nationality.where({ name: 'Taiwan' }).first_or_create
  Nationality.where({ name: 'Tanzania' }).first_or_create
  Nationality.where({ name: 'Ukraine' }).first_or_create
  Nationality.where({ name: 'Uganda' }).first_or_create
  Nationality.where({ name: 'United States Minor Outlying Islands' }).first_or_create
  Nationality.where({ name: 'United States' }).first_or_create
  Nationality.where({ name: 'Uruguay' }).first_or_create
  Nationality.where({ name: 'Uzbekistan' }).first_or_create
  Nationality.where({ name: 'Vatican' }).first_or_create
  Nationality.where({ name: 'Saint Vincent and the Grenadines' }).first_or_create
  Nationality.where({ name: 'Venezuela' }).first_or_create
  Nationality.where({ name: 'British Virgin Islands' }).first_or_create
  Nationality.where({ name: 'U.S. Virgin Islands' }).first_or_create
  Nationality.where({ name: 'Vietnam' }).first_or_create
  Nationality.where({ name: 'Vanuatu' }).first_or_create
  Nationality.where({ name: 'Wallis and Futuna' }).first_or_create
  Nationality.where({ name: 'Samoa' }).first_or_create
  Nationality.where({ name: 'Yemen' }).first_or_create
  Nationality.where({ name: 'Mayotte' }).first_or_create
  Nationality.where({ name: 'South Africa' }).first_or_create
  Nationality.where({ name: 'Zambia' }).first_or_create
  Nationality.where({ name: 'Zimbabwe' }).first_or_create
  Nationality.where({ name: 'Serbia and Montenegro' }).first_or_create
  Nationality.where({ name: 'Netherlands Antilles' }).first_or_create
end

puts 'Nationality table was seeded successfully!'

puts 'Seeding Users...'

ActiveRecord::Base.transaction do
  User.where(email: 'admin@email.com').first_or_create(name: 'Admin', email: 'admin@email.com',
                                                       password: 'MyAdmin@password123', role: :admin)
  User.where(email: 'user@email.com').first_or_create(name: 'User', email: 'user@email.com',
                                                      password: 'MyUser@password123', role: :user)
end

puts 'Users table was seeded successfully!'

puts 'Seeding Players...'

ActiveRecord::Base.transaction do
  team = Team.where(name: 'Flamengo', acronym: 'CRF').first_or_create
  players_data = [
    {
      name: 'Santos',
      number: 1,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1988-01-01',
      position: 'G'
    },
    {
      name: 'Leo Pereira',
      number: 3,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1978-01-01',
      position: 'D'
    },
    {
      name: 'Pablo',
      number: 4,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1986-01-01',
      position: 'D'
    },
    {
      name: 'Rodrigo Caio',
      number: 2,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1989-01-01',
      position: 'D'
    },
    {
      name: 'Airton Lucas',
      number: 7,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1989-01-01',
      position: 'D'
    },
    {
      name: 'Varella',
      number: 5,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1989-01-01',
      position: 'D'
    },
    {
      name: 'Vidal',
      number: 12,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1988-01-01',
      position: 'M'
    },
    {
      name: 'Thiago Maia',
      number: 14,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1989-01-01',
      position: 'M'
    },
    {
      name: 'Pedro',
      number: 9,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1994-01-01',
      position: 'A'
    },
    {
      name: 'Gabriel Barbosa',
      number: 10,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1993-01-01',
      position: 'A'
    },
    {
      name: 'Everton Cebolinha',
      number: 21,
      nationality_id: 31,
      team_id: team.id,
      birthdate: '1989-01-01',
      position: 'A'
    }
  ]
  players_data.each do |player|
    Player.where(name: player[:name], team_id: player[:team_id]).first_or_create(player)
  end
end

puts 'Players table was seeded successfully!'
