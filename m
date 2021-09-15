Return-Path: <ksummit+bounces-587-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F340CCB6
	for <lists@lfdr.de>; Wed, 15 Sep 2021 20:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C49511C0F5E
	for <lists@lfdr.de>; Wed, 15 Sep 2021 18:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881746D17;
	Wed, 15 Sep 2021 18:42:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632213FC9
	for <ksummit@lists.linux.dev>; Wed, 15 Sep 2021 18:42:08 +0000 (UTC)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FHZ1cx026307;
	Wed, 15 Sep 2021 11:41:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=i4K2x0or35pkdqZM0te73BOmLa/hu93xFV3gZg3YalI=;
 b=IJS8NMwiAlBzab3GzUPJAFN4Rslsh4ywNl0+DHQURYbSCAju4aXvJLHw256UqMBaIuwU
 F1offaBWalseawJdXdC8cPlJJcJu9mvxLdKkQvLt4YQQV6gOZd3Dfbxi/A9mcFWBCSNd
 wBAx+sBlRnhAm2/t2DhvjjBnM8H0yyFtEKY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com with ESMTP id 3b398acykg-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Sep 2021 11:41:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 15 Sep 2021 11:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl5HCPJFvHly7t6TG8eMvz+OQUeU3yIYT0Mbkq1WiLEdODyh7/ILR/gZRlLzqpnoMn3mZSo0PG0Mvkd/+/Mz2YD52CMgwH95lysaKbx4nnJrosz/nEf5M6eTkrsXB/+SYRcYmz3f1seN6tpP8n99AZmupySm6kvsT+49TCOD0muw3EYsjno9HQGnMdqtD7BRpOi+5SxNMBhzSPNyRG3rFpyMAIF+skUtoiO/n949qyhVoas11GAOMumIjdHVu+j6+Cg4faekNSCoTfJUEIIECQeCKKfAVOJfyLm56XDt7z/NzzRHvv4ZNkPw8aXG6Me644otgPf1MDUKYFdmsDsMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=i4K2x0or35pkdqZM0te73BOmLa/hu93xFV3gZg3YalI=;
 b=GSNFZqXtezcGQW0YoZ7KK8ROynjUcoDcxKyNSCPcP1uiHoL7tiPYoXTeGIKR32fD0Kj5rCjCxS2lINQbUoq39YR1k3QwQVSkFgS7xpZYBy6gvm+3dElHz/feHpvvpCoYZ+Q56SAREtRoBfkiIm8U8jjM5ZkAv8al1GDYe3RH/NuVM3Xb0Jch1czXSNpBdcW76lA+CpBVGJF9uLPcbj8dRYKJcGEzQGlLJm6S4lwDPl0jDtN97PJXpIhvdfJzBexaktp//AQjI1N3cm2z5/W4rrfXggQC+tkM50Ap2w6H/xSWLR28b59Y9KoMKps50rVQ6gidbsYy9EdR1fO0E6wLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from CO1PR15MB4924.namprd15.prod.outlook.com (2603:10b6:303:e3::16)
 by MW4PR15MB4330.namprd15.prod.outlook.com (2603:10b6:303:bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 18:41:35 +0000
Received: from CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::409a:5252:df3c:dabb]) by CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::409a:5252:df3c:dabb%5]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 18:41:35 +0000
From: Chris Mason <clm@fb.com>
To: Theodore Ts'o <tytso@mit.edu>
CC: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Johannes Weiner
	<hannes@cmpxchg.org>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        "Matthew
 Wilcox" <willy@infradead.org>,
        Linus Torvalds
	<torvalds@linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        David Howells <dhowells@redhat.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Thread-Topic: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Thread-Index: AQHXqlkZYMl5M/taiEScAPg40L4dIqulY1sAgAAErQCAAAXjAA==
Date: Wed, 15 Sep 2021 18:41:34 +0000
Message-ID: <17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
 <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
 <YUI5bk/94yHPZIqJ@mit.edu>
In-Reply-To: <YUI5bk/94yHPZIqJ@mit.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: mit.edu; dkim=none (message not signed)
 header.d=none;mit.edu; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64eba2c8-6777-4263-36a3-08d9787871c9
x-ms-traffictypediagnostic: MW4PR15MB4330:
x-microsoft-antispam-prvs: <MW4PR15MB433084EA968C24FCE7313840D3DB9@MW4PR15MB4330.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJcECwFdzE81R4nBRdZq/dpdZgDI9hQ+O4SY1RoC7bk2NftxQaTAJK2uKLds28fHmPoVtg2p7j3VeELwX70mG5XZ65w/4PvtFTVIyyzC7tAoZnbB7xvbX7qq4ISy8f8BmlVFLLQjZz15/g8SU8RfgjcCEATu5nx0cPPnwrWw7oGR/tmdMmzAbwHwcFxXGJJNhtOSSGbMoVxiWuxrwm0WdbFUvp+MPRo9LMvXcU1UJwjsF3u4SZBh4oyVqlvVPsR0cwPB1/Mz41Emrf62lmHXl3m3TxGHWvbecNYjsFP/6InKl/aFhmBEE/s6yJLl+k0j6yNK02pfCTZuER5vHVUg//gsjrKRL0t2lEgrSyWNAnrwS/pLp2rtde9rCaokSDsduiVoMKMN48QA9iF3qdbjkLIOZS4GDajmfzBHzX0icUK0Q2BBvC5jsC5zCxrgWf8ecCTF0+Mz6x4YU+k9m/dJ52ZfjeXuvrygjPAehJKm6hTBrTn+Mm5vfcOT79enhVWjBjjuPyIv7vSYLw3wGW2ek0JbIcRmuWRvfDObafsIZWWRs2K9hGUhoKvOMzkQU1MWSJ3QPwZkJoDEMnus1lsb98S9reh5F8ArsUwJnOMPgGUdw7s7CxZQabRE8zQ1N+IZffDTpi/DOll2ErTIu9SFv2rFTW9rm6q2BvuiVDeUUyZeDSx39IPxNMYrUpnWmd2ggwSp3HZ5mEnKhAiVlHV1yH6J83+yqxUfUZciBbibBMDV0VoVl3ojW20FCa2HkjNH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR15MB4924.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(6916009)(8676002)(4326008)(8936002)(38100700002)(6506007)(2906002)(53546011)(7416002)(71200400001)(316002)(6486002)(6512007)(478600001)(54906003)(186003)(5660300002)(66556008)(2616005)(66476007)(64756008)(66446008)(66946007)(76116006)(91956017)(36756003)(33656002)(122000001)(83380400001)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Ex1PZeyF6pLYVy34pO6VoXffmIz96aFsu98BER4eSRFj+mny6Mb3dDqiRbt?=
 =?us-ascii?Q?6P2Fo7Iz2lDVAFqco+rToTsBWKVV3RL7vrRG8Xi9AfN9vlP5ew/bNu5HRTo1?=
 =?us-ascii?Q?/yEyFadXdZxz/ZSiGfa7RW88TeCEsEMKp3GsH6vBB9Zb8yyTP7AEyBzlDDXp?=
 =?us-ascii?Q?auruvW/usBsy7+C3mR3pQ7KdALS5SdRhN3xR4qDHXbMG/A6Nl4UOxKj+HcYj?=
 =?us-ascii?Q?vuqR/yudOS8Lr+4dd/53D1B2qznqk8uLFW7AhgoXRsGY9gXylDxPScLpSB3f?=
 =?us-ascii?Q?bkjsV8HGBbvQMjZYQxV6WZgj9g+At+CIRBeuFsX1bV+6o/Zo2DWJrdanMEFY?=
 =?us-ascii?Q?q+N4fkR28X5mB94M7E9ZVsRryMCGr0ElXVas5aOiDpMW/OPt1U3stz2UB41+?=
 =?us-ascii?Q?PeTJYlZOvq6VpqiEfGhykqmiJcGloprjJMV4gYvwcjYcg3dtn6qw3xiToI2Y?=
 =?us-ascii?Q?Ep9inLy1qYVNBvCPNZSKyxvLn5ibTz7q48FVDIjoROwnW5pyiGK7cHJw25xF?=
 =?us-ascii?Q?oRIUNK7aG/JJv9tJ1bZt9pCN2ve6To7Gi/vGeZ+u6yLzUptqU/9FZIjZ8+RU?=
 =?us-ascii?Q?jbPWBCy5pkXNbPqsF1up5fRCRlMk9lqQWRTfoc3bLAvR8RozvcwAGLoAzZmS?=
 =?us-ascii?Q?EeQIkPLYow4h5fn1Dkv3JjITCqjO1W/NIgDjAWANSMySXQnsNw338plRsdTN?=
 =?us-ascii?Q?N3mNvBLrvXakubv2gLBdtDI9HWqxmkrAUueYWOSeTDXaknKbkcmz1j6KZyM6?=
 =?us-ascii?Q?e/HX2zW65xLEx6cneqyOHtU2UF7a6RH/Vh6IgaDkGY/qwtGSDw8ehxUd2wnI?=
 =?us-ascii?Q?l4hIzemJyrhGNxqw8bAzTRI1xK1WqUl0ZxE2C+8cW67VT4v6i6mloWNKwwYa?=
 =?us-ascii?Q?gY3YefF82S37nMhj9k8diwGQL2DzG+oJI+7NHIRT1zIcUBNYMHC0800lqQSH?=
 =?us-ascii?Q?bghr4QQxr4C2b8DDWyiffTowHnXIHOllAMTkMZqtHNNe3GwQF1tFe4ku3wlp?=
 =?us-ascii?Q?M0J52ksbtVu5c2kZqrIyJpmRNmSpKhex5DGxUSMxnTwlyJ4hBQQtqEIyfS4i?=
 =?us-ascii?Q?hB8b0sBRV3d77LYiaGBvY4j+w4e1z6wbsPanYR40Z1F+j2Pj3MRfoTwIcduQ?=
 =?us-ascii?Q?KbK+cJtWUxykVfIgLA6yHLmeBahp14DpZIXwzX7Uw/6fpoTNpCfa+bV5Nr+O?=
 =?us-ascii?Q?VSlz+wqVqCrHnDHUnaQMUEkusBSnqizonuFunKCACByyZXpnCCT9xkZq8WiQ?=
 =?us-ascii?Q?qcTcNOWgz+3onNM06uAN5Vwn24b4rjNg9T3QlbpN9x4jsXZPW+9XKiI48+r2?=
 =?us-ascii?Q?mHaNJZL71tMetSy2N0/Xw69x1pxEPYxF1+cYCSxGpkd1RwHJ2/dMccU2ddmG?=
 =?us-ascii?Q?2y/DIpk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67BAD95DA11D5F4CB2791C9050258FB1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4924.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eba2c8-6777-4263-36a3-08d9787871c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 18:41:34.9001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XADq3HijBUoxGzDbUD7wAqvAkRp+AaxIE6kOxoWJM+V6v6W4o/rc0C69UHRTett7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB4330
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: sicvZJiWxNsfOWnRb-fcefFlvjpk2ldk
X-Proofpoint-ORIG-GUID: sicvZJiWxNsfOWnRb-fcefFlvjpk2ldk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_05,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150107
X-FB-Internal: deliver


> On Sep 15, 2021, at 2:20 PM, Theodore Ts'o <tytso@mit.edu> wrote:
>=20
> On Wed, Sep 15, 2021 at 02:03:46PM -0400, James Bottomley wrote:
>> On Wed, 2021-09-15 at 13:42 -0400, Theodore Ts'o wrote:
>> [...]
>>> Would this be helpful?  (Or Linus could pull either the folio or
>>> pageset branch, and make this proposal obsolete, which would be
>>> great.  :-)
>>=20
>> This is a technical rather than process issue isn't it?  You don't have
>> enough technical people at the Maintainer summit to help meaningfully.=20
>> The ideal location, of course, was LSF/MM which is now not happening.
>>=20
>> However, we did offer the Plumbers BBB infrastructure to willy for a MM
>> gathering which could be expanded to include this.
>=20
> Well, that's why I was suggesting doing this as a LPC BOF, and using
> an LPC BOF session on Friday --- I'm very much aware we don't have the
> right tehcnical people at the Maintainer Summit.
>=20
> It's not clear we will have enough MM folks at the LPC, and I agree
> LSF/MM would be a better venue --- but as you say, it's not happening.
> We could also use the BBB infrastructure after the LPC as well, if we
> can't get everyone lined up and available on short notice.  There are
> a lot of different possibilities; I'm for anything where all of the
> stakeholders agree will work, so we can make forward progress.

I think the two different questions are:

* What work is left for merging folios?

* What process should we use to make the overall development of folio sized=
 changes more predictable and rewarding for everyone involved?

-chris=

