Return-Path: <ksummit+bounces-727-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799A55BAB3
	for <lists@lfdr.de>; Mon, 27 Jun 2022 17:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 059DA2E0A97
	for <lists@lfdr.de>; Mon, 27 Jun 2022 15:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12FF33E2;
	Mon, 27 Jun 2022 15:29:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B413235
	for <ksummit@lists.linux.dev>; Mon, 27 Jun 2022 15:28:58 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDd3hv031567;
	Mon, 27 Jun 2022 15:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MYFxcsr8ynTWaTOCAn6SVcupdCq3WqDSv3iojFhT28Q=;
 b=NRe7wFQ9AD1uJ9kqg2ZnsPHI9wFj9Oys2SQ71mxzffdjNtp5kNKwuKGDrBmFpZP5W/S9
 KYjlFJwMbQ1VuDpcaiMKXcVnGwc6ek6OCltaxt4fqWCBi8vrUSotHNpJNHXAl95D8kTD
 iRWhcG4o2+v56LxBFWorjpnjkQ47xzGuaV/RpHTRFF2G4/2lv+hvfkvE/hhyXapigzIt
 oNi6xggLngEE/g0hfiR98SHAKAJhmKTfA+LhK6593QFZr5IxMquPA0o61VyuRwyAPUkm
 pGNKsn3ObnzOakOtTnLapooQ7JrrKAiZ2cgofrnPcsChpW6XIBpDbxSEY4emZI8T5/D5 QA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwrscbkah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 15:28:44 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25RF6mq6034214;
	Mon, 27 Jun 2022 15:28:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gwrt1hvda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 15:28:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUCEXQZISZYP1YPZrKGN4/dgm1wDgJC/t3Gf3IPjimCiVRDLHhj84q+S/f+kvc6Pa6GB1Lp+juIbqXv8W8xSJgxRY0jV1j4y/B2kVGlz9NxjrzKMSNLgykR6wwiW0KVbTq2bJGevCXJCd8KYWVKaI2y4KlEyZSHajPOgl91i/Ajd3WSshVfTNIhorwwyxqrUpTyrK8DUEyH0XT1N8mgS2yCP7MJ0ZKXPTxuJlojZDYgrdjJE8IdBdj9rS8XClGi8I86RdblapGFcyTDKwnCkXdQluIGzIpYuz1EdUXcknqlxCfkzzXbB5dRTy70j9ag1DreNd20Heqz5KiTE8XXr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYFxcsr8ynTWaTOCAn6SVcupdCq3WqDSv3iojFhT28Q=;
 b=JLrnhlQYTKPk9n2+KbrR1vlhfRuqtm6Yk0McGqSHaRSlJtA200AdcImrDGzHBIFtVhUEu5st4awa/gvJu+cioAlFMVQpVgP62mEdLmDds1beHDTlMhQeHFR8sYgkUGfiIltnZ2xzheVbhnObPB6THtREqCRbd4BNkTn4RwV1lwG7hu7DjZCX7TxVQ8I22mKfWr1aCHajLavuGepa+Jcve9p6T/zZcOtOcx/IclY3oFG9UAOTJn9J2Ov/DXE3JwZ05AS8zBmtplM30S04hHcsHV/7nOoOTYDsQsRr4hQ9N2L3Gpqmda657dym0/PTeixMpYSXJwUNev6fTBExUxK0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYFxcsr8ynTWaTOCAn6SVcupdCq3WqDSv3iojFhT28Q=;
 b=ZSvyvFbovE6qbZA6A4nYV11qwMeSSgwBLTEEHqXWMqMyWWwa4Mb9VQsaHIgC/cvcq9mkyPp2i4k5+p5JQK49n5cDpMXt7qoj980XANvVvyqktpYIDcGzoH69OCVHJdggP3M3i5rdbiYcg0bQZh2oiFZOGRAKnowbmpxjKFuZyTU=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN0PR10MB4853.namprd10.prod.outlook.com (2603:10b6:408:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 15:28:40 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 15:28:40 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
        ksummit
	<ksummit-discuss@lists.linuxfoundation.org>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could be
Thread-Topic: [Ksummit-discuss] [TECH TOPIC] What kernel documentation could
 be
Thread-Index: 
 AQHYgozYmp0gfOp9sECwYLosM5gob61U1KOAgAfqwwCAAArigIAAPkuAgAErnoCAAQJkAIAAqyWAgABRCgCAAEYqAIAA5iYAgAAg4wCAAfANAA==
Date: Mon, 27 Jun 2022 15:28:40 +0000
Message-ID: <20220627152832.yigreu5ztnoxfp4g@revolver>
References: <875ykrrb45.fsf@intel.com> <20220623105747.079ac92b@sal.lan>
 <87a6a38plu.fsf@meer.lwn.net> <20220624083307.159824bd@sal.lan>
 <87tu891xfv.fsf@meer.lwn.net> <20220625101029.67f14c4c@sal.lan>
 <87czew267z.fsf@meer.lwn.net>
 <CAHk-=wi-NnjCMTd5aC_WLfXN02gCXFOm0dbvSPaDYDkiByfrEg@mail.gmail.com>
 <20220626085524.42ee92c0@sal.lan> <20220626105306.122cdeda@sal.lan>
In-Reply-To: <20220626105306.122cdeda@sal.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d7721fa-4d28-477e-d538-08da5851b6b1
x-ms-traffictypediagnostic: BN0PR10MB4853:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WOh0kfMl1CsdyXWT6bZ3yFZH6lZ65r85M4oHGzLjTmV4i1oj+cZ2a/zofoLg2iRAejzegf2fDHtjhvKzK8hTON8Mps2jbilO8ARfHGJD+gfhLHKqmc0AAJjKcbvnsaVwEWVMKTqPTdxDOsMCwDHD3N+mJD9EJ+0Hg9EAuI4XhFRLF4aHg4u4V+aeO1zPWYJ5s4yu2/Lp792HjbWygo0L1t01J/eM2ohn6f8lBkx8igKnGTHZXkpiOa6tzfdAurPEIKOUGg5PPAZervDjt+qn/E1JESsSFPSpcuGuAqyyLQNbDV0ipCn70iJuRgf868vx/pNcY1SwWXLuoJ7pMcjQyi+iRkXDJ3+jt4gdR1l7EZlQGsKZWE1sIUapN+Di0bPrcTSL2uYZVOeu8ev1fKXHKQmrlgtOZu/TjE2fJ7iLAdzYA4EFxZiYQehiQVmRbvEhkmc3WgUMyOCFuPCPLwLS4j4dTUmU91IupI6IrsMrE3F3CVpJd0/XNypA8NdEAWvCxM8BEl59q3bkNhtqdBKigpQoIeAHAQTGYLuyoz07YibWpvqf1dKJnq61y+8UQRGu/rGy6Yl1RCCN+vzYI9jQorth8CIhb+7kALz5PdHZuVaYsOc2crZCYXXzj7l9QOyjPcwbpoAWy+ZFzCLykRUlwEeDP80xf7xOW6nQVPUoUm43FfdYXrioofKFnJaNFkmULXR2lRgyZNSqfjrhAI5K8piovKcRo14kAGBnTaDPGRHbLUskc5ZaFwh2R8KsMRXedfa0HhBImGOEi3zjSMurlrqcOT4qufGDn0OpK+7aJq4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(66476007)(76116006)(66946007)(6486002)(186003)(83380400001)(71200400001)(26005)(6512007)(66446008)(91956017)(2906002)(66556008)(8676002)(64756008)(8936002)(41300700001)(4326008)(6506007)(5660300002)(86362001)(478600001)(9686003)(122000001)(1076003)(6916009)(53546011)(54906003)(33716001)(316002)(38070700005)(44832011)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IYloFcqr3w27K5i6WXg5zN0LAmSJtg/wejkn44J5j8rRWlV8QKMUfAjPyrpB?=
 =?us-ascii?Q?9fKmDSjnng//dRo6Tyx/+98SuiuKfVeTRY280vdMxgO4l4Su3obn89p7DjZI?=
 =?us-ascii?Q?QxUZhhhEH6tEswriSJYk5XU6HLlxnRi7CeTnwfMfEh3B1ClR5rOLsvv4sg6l?=
 =?us-ascii?Q?2I2sJE5ahvKuCRIbCWtV1RFl30jNj7zp/CFGPJJksQpPm0zjrXw0XN2XlYzz?=
 =?us-ascii?Q?6fXOV/NsVAHLLvZ1LTY2Q2r6LH7xUej8mulbNPFQNhBs4pXNWirkw/G5+/4e?=
 =?us-ascii?Q?dEUkImJNeI1N3HHePCMS5oQ5egDto+0MJwrEB2JuTdrQpeIknlv6pQKvpHIh?=
 =?us-ascii?Q?cAbvLGlEVoRpJE2WKrejyF05uILZJn9RC+NN5tKEaqSLb6h92HtoMh3z+g6A?=
 =?us-ascii?Q?LeTkwOUK/tlTCy+sAJzwQDMGc6L8iCF7dO1rHR3Z74ZcAvywL/rxsVQkFwtI?=
 =?us-ascii?Q?qEzXHhRZ976T0pJ36BTvyVcOBKQO4ZjH6LW8wxXXOw5fuz7hJDAoRihZAds3?=
 =?us-ascii?Q?ZMdHS882RjZdmzvui5AspMJFJhuMtmT7CgqFRJi4TLCDiHqpzYqrE6rfVYPk?=
 =?us-ascii?Q?kspD6eyrA6TFwFhfXWx09oFF87MqaqqpxeRF7g6Y1G0C1LiwKC0e8IaPaohM?=
 =?us-ascii?Q?k+c5t8mSbkv04/V0Xhuvy+40GCIyT32Hjot3Xe5Hol6WgRJsQU02z3NR+Tiv?=
 =?us-ascii?Q?/dWS//qQidVSQbD0D5jb1spcrLgvekiz+A5FtAaEtfPz/io/jbiCdHiSyovc?=
 =?us-ascii?Q?38+p+GEH96MBcboIY8m8FYLuYuqPOhV61dcyrp/Tk6pPMVNmLvzCq3Wk4IaM?=
 =?us-ascii?Q?+5fdHwA0/WyvpYb5SYQUld9aPHABp4GaX0JV8VVygpJpHliZYH1vFLRsCyIw?=
 =?us-ascii?Q?D5oGbcC9/5qAw00u/BDC/YxPDEB/RvkjcnQ3dFZNqapDLMcyxzVSD7GUo17O?=
 =?us-ascii?Q?UeNvR7i162CTzlCNjJe8b0PYK0ispMDpufO1st0KH6xnH7fVTPX1AXqQdCb4?=
 =?us-ascii?Q?XXBGUWJEySsff3O187PAQOZhw7lDKxVjSbUo9EYzewNqI19btcuQIEXoOQwM?=
 =?us-ascii?Q?4WVPVxElHPuzYclnpujkGYfPZxIcxmVHCMvMCumqJBVdK91CCFSSmOm8OtZl?=
 =?us-ascii?Q?+AjzlB8HWyeNGKa2i78wXZspy4IdumEfhZZ7WGe5Me+PV/Tz6Yfx/h3uDvyg?=
 =?us-ascii?Q?nkw+qrglLtoL7feEatKHcUF30rliAndUvqfGCBcvcxxYsEbFTMKCQmnGGnMQ?=
 =?us-ascii?Q?4UhIMfMTH3ouvfPeaKcvWugMnwkCC5oiF5HJWJ1aSJiVQOjkXsf8TU6oybGL?=
 =?us-ascii?Q?OaNcnd7jPMjnaeK/wLKVglG6yjuvTYYfnPjIm+bdV6ogHBKN8Ir8QDRZHNqe?=
 =?us-ascii?Q?hIMADXSiKo+jzzP3LNHGIq46cFPDh1YuqqgWLJpzSVGFbDCjoJJJ1HajWAlY?=
 =?us-ascii?Q?SvJ/xMP0hwkNaPmZlE1kNhyEZIMMb4skOK32zfDeZaXBGgE15QWQHusmOdck?=
 =?us-ascii?Q?yPsKGVtfxwSLmyUIa5AeCqylgI4POb8ogMR1yeZwju3jI/uTnAqhoqNAafef?=
 =?us-ascii?Q?cYoKGh3AOtNARK1SHcj4/Z3G5aRE29DcVbYqhZS76g/tnfQSytcZDuOvS/j4?=
 =?us-ascii?Q?fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16F0B4D01D447544A73C2ECB4244E7C3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7721fa-4d28-477e-d538-08da5851b6b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 15:28:40.6580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOKUsThofa5woSu32jTG0Aehhn8UvrP8jg0KTfr1gWsAz4aCv29m1pNOymTvbh+Yb9fFSzJPjQ5V0jxpEzzqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4853
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-27_06:2022-06-24,2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270066
X-Proofpoint-ORIG-GUID: UbxfLeVanvHNjgi6EGgBz8otwGFY3wev
X-Proofpoint-GUID: UbxfLeVanvHNjgi6EGgBz8otwGFY3wev

* Mauro Carvalho Chehab <mchehab@kernel.org> [220626 05:53]:
> Em Sun, 26 Jun 2022 08:55:24 +0100
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>=20
> > Em Sat, 25 Jun 2022 11:11:40 -0700
> > Linus Torvalds <torvalds@linux-foundation.org> escreveu:
> >=20
> > > On Sat, Jun 25, 2022 at 7:00 AM Jonathan Corbet <corbet@lwn.net> wrot=
e: =20
> > > >
> > > > I said "some" - this was a proof-of-concept hack.  The complexity o=
f
> > > > their symbol lookup code is ... daunting ... and not something that=
 gets
> > > > fixed in one place.  More research is required...   =20
> > >=20
> > > Note that at least for me, the issue with building docs isn't hugely
> > > performance related.
> > >=20
> > > Yes, yes, it would be good if it was faster. But..
> > >=20
> > > The primary problems I see with building the docs (and thus checking
> > > them, the same way I do an allmodconfig build test) is
> > >=20
> > >  (a) it's insanely noisy, which makes and "check that it's ok" ENTIRE=
LY USELESS. =20
> >=20
> > When the environment is set for building docs, almost all output there
> > are actually due to build errors/warnings that got introduced by patche=
s
> > touching documentation that were never build-tested.
> >=20
> > There are 4 components that report errors during "make htmldocs".=20
> >=20
> > 1. Documentation cross-reference check.=20
> ...
> > 2. ABI documentation check:
> ...
> > 3. kernel-doc warnings.
> ...
>=20
> Btw, once we fix the errors from the above checks, one of the things that=
=20
> could be done in order to avoid noisy doc builds would be to run this=20
> during normal Kernel build, if CONFIG_WERROR is set (and if .git is prese=
nt
> at the source build dir):
>=20
> 	./scripts/documentation-file-ref-check --warn
> 	./scripts/get_abi.pl validate
> 	./scripts/kernel-doc --none $(git grep kernel-doc $(git ls-files Documen=
tation/|grep -v kernel-doc.rst)|perl -ne 'print "$1\n" if (m/kernel-doc::\s=
*(\S+)/);'|sort|uniq)=20
>=20
> aborting the build on such warnings.
>=20
> On my notebook (i5-10210U), the above takes ~8 seconds to run. So, it=20
> won't make much difference at the build time, and doing that would have
> avoided ~100 warnings during htmldocs build against current linux-next.
>=20

Couldn't we add this to the build bots and ask the authors to fix the
commits?


Thanks,
Liam=

