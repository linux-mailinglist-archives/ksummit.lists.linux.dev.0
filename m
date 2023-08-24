Return-Path: <ksummit+bounces-1062-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF9787864
	for <lists@lfdr.de>; Thu, 24 Aug 2023 21:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDF25281667
	for <lists@lfdr.de>; Thu, 24 Aug 2023 19:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA29015AD3;
	Thu, 24 Aug 2023 19:13:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BA2CA76
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 19:13:27 +0000 (UTC)
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OGi8Zv021684;
	Thu, 24 Aug 2023 17:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=S1;
 bh=rpeqhU39fIMw49CZHSllzW4GdBfYudvhrzs0Kmwy870=;
 b=JaXXzINMu6o82ar5eJjVZbq65OLIYQZGDxUfVVTWp9BEP+EPtAeJ6NGYqp0Jjfu4to20
 4B/HG5NYSgm3/y0C9O0vFOi07H402TQcz2rnakQE7KXDnD99VDLeNIVJpB5tG3v1eRQ9
 qeDNNKdOESBmnW79HI53/rq3Oc/BL1qdjjXihEBg0Awu7aU/qu2XxTA49cZqHLNSxdKp
 6BXlCsW3yPn0VsVBkVZxy4CTGPHpcT43JQMSe39IbSLZJFU8TLeoxyylWQ5jDEVUkm76
 k5iTlLC2E1hTcXPGW4DSfKT/umwVSrW9wECOdcFECTuIwx/JniOOZG/lOySYyY7ku/dK Nw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3sn1xv253p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 17:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIrvDdNvGSg3zGtVC8X5q8aGAO9lmphwPT4Pdd64VbJP0aRtNY0/Ri/M6lYu6yVyuDfZsWYcNrnKqmk5ic3xybjJnJZ4B1pL3DXSXffflU6H38pMA6TNudxEOBIiwdFv4GWKONe0e9b27KBs2/tTK3Tvqc2lQme2GRPboVz6W4nbU3bEJjs62KAvdnxtJzgZ7GNFlb11vWWl0yb3WPOYjsndO95+ij7/RzciDyhsU7oUquNg3haX5AUhotO6NiejGFo4YE1JJGA6fXrqYIQyVNGywN6poGai4xNxhkFR/+xkR2EcGLquDpiUgGCSUXEoOCQpGMCzU+FbpK+riXvLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpeqhU39fIMw49CZHSllzW4GdBfYudvhrzs0Kmwy870=;
 b=jkZh0oRTFi/vL0NO5/6fG4JFtpWDr78LAJxOS3Abf77qBRHPuY/8SUeptgsLtmTFFtaOIwoACpNbvoT3iYhmDJuVvgryq1G0zWlsS442JmynD5rg6JnV0or3b4HmMgisY8bSVqZ6U3E8LB/BwHI+LWm1hwAdEkgpBhwpat6MoTrOWM2mlYFyZVB3K8RraECPpdbzKS8G7xfSLqOeSPKS459ETtG3G4cyHU0ZtBeNRNeTEUG/qUnFIpw9Z8JUUYeqIsGgTEdwIUlXd5chv4nSoFOW1ur5sSq75T2TXzVeirj7Mtr9nc2jNICdp4ZZJa2pPufBqLoImt2mW5neB9n93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BYAPR13MB2503.namprd13.prod.outlook.com (2603:10b6:a02:cd::33)
 by PH7PR13MB6090.namprd13.prod.outlook.com (2603:10b6:510:2bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 17:20:32 +0000
Received: from BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b2f8:c53b:d351:7809]) by BYAPR13MB2503.namprd13.prod.outlook.com
 ([fe80::b2f8:c53b:d351:7809%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 17:20:32 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
CC: Jason Gunthorpe <jgg@nvidia.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>
Subject: RE: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Thread-Topic: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Thread-Index: AQHZ1NZoN3q7nfEXaU6cW0F4xRbqo6/2YF6AgAI+6QCAAH2fgIAAlbiAgAAApXA=
Date: Thu, 24 Aug 2023 17:20:31 +0000
Message-ID: 
 <BYAPR13MB25035A643E9E57FFFE06B644FD1DA@BYAPR13MB2503.namprd13.prod.outlook.com>
References: 
 <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
 <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
 <ZOePd+0Ncywxa5kZ@finisterre.sirena.org.uk>
In-Reply-To: <ZOePd+0Ncywxa5kZ@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR13MB2503:EE_|PH7PR13MB6090:EE_
x-ms-office365-filtering-correlation-id: 99ac1115-48e0-4562-8db2-08dba4c66b87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sYq+NaoVucZ0Coxrbua1yJ1ZQLmn18zakpswX2QwogfgAeSlRpJ8pubvHTo5wb0U6EBTXmEHljoonaNWAZp5rGZG+6tgGGjMU8F5sfDJqcSb1hqWiwyjM46E6Gvo53Kh6ui4PqqFRytPkIpBE4U4LLbTosoYio5g4M8MVEnIEauHWfbY4Nv/xvlLscw5A+lftlBIrrhy52Z93Fk55sjrv3MKRu7ofAIR6o7k9we1c959/gU7Xksx8p3AK8cBh12I3KeHWu02jiIV40itZ6eto/B1P+HeSalL7A7aOIhsfv+TxtaABpSBS/bLUl1vpuKKe8Jok3hGI1gyiqcKhYnEBNlSXhSHM/wGfKKiUUfeQyOKQrPTv7+h6KtlblzJkO/zgprhRvu13oPi7j26E6K2iaRwaK1Lr3AU2SZCB5RIIeD6XD3QlZ7g9YoA8sR8iflFRE8ps334IkMw2rAg71JppQIc9s+jK3m1zrVFbin2OhSrIABt2a0XRWqhYYbU+K/voRXadHqQS+ZinI8WpppKG9VLhDi0A8hH+M/MRBKDz2cNin+2alUwxK0PfEADx/MuUm7HR6PrtqqBQyRYWSEggn6CdA41w2cglpYabQDJlSmqxakw3kZMUNyBai8SXuh4fXthArdb4PVZvnZ6/qOUgDiC6TYgiHEsJ/djTMUda53R0Y4W6TaKuX+olwizPni8TAGK7tOtymbQ2qp0hBj52A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR13MB2503.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(186009)(1800799009)(451199024)(52536014)(5660300002)(4326008)(8676002)(8936002)(2906002)(83380400001)(33656002)(55016003)(26005)(71200400001)(38100700002)(38070700005)(82960400001)(122000001)(66946007)(66556008)(76116006)(54906003)(64756008)(66446008)(66476007)(316002)(110136005)(478600001)(12101799020)(41300700001)(6506007)(9686003)(86362001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ib10P2HkCrNCJeApCmneFKwX5+Z5vfWt+czp414a1lSUFoacA/Lzw0noXiCY?=
 =?us-ascii?Q?GvP+2R+BPYmxdZyLucRf4inUCLwc/rAgqkK37I9EMv0PSiIYp++vOUQEATkA?=
 =?us-ascii?Q?nmngafx9J4XTedsxDZ8B0oXtbGNlElAbvnwdP2TrJsSoclohfYShQ1ilA7HI?=
 =?us-ascii?Q?wHS2H8FXnjPDBDdclrN6fgJonDWYPNBplcnY+NPeynvR/TqZF+/CLiptB+4A?=
 =?us-ascii?Q?eNVFwgUmbej2P2Q4guH+F/dFlezK6+iQbzotQuunRVPHjR9xM5Q/GMQrGyJY?=
 =?us-ascii?Q?KDei4b8N6kcKP7+uZNpg3+OtntsGEL1DkM7fukegsiiD/KODeyvGZWDiHi5E?=
 =?us-ascii?Q?4Ol+u0VpvVkWBIkWCVs2e3zdWu8joRdP2oXB5oEJbBYPQ/UFqJ6NxflIv4PA?=
 =?us-ascii?Q?nExdIJHhTjjLKYAGD1zwYQ1h64CCjZGsys3XpN2cGxoeKPGA5Vk/m2ANnq4P?=
 =?us-ascii?Q?Jniv/azre5o6VosT+/ox6CwlFq72SanQQ7cNdczWP9RiHpLTVpb65i/DfAKx?=
 =?us-ascii?Q?oP9FMXbdTfwSeiPZA9FQqmKB6sfgTxy15/MeYu03NzMu97QLNELWqRMRbqGJ?=
 =?us-ascii?Q?n+hqABD3BgAN26u6kUjjyNba09MBEfOsOidQAZ2ykEXdViBj4riOTUWPXeHW?=
 =?us-ascii?Q?cfUvbD3XbgN97sl9echwE0Xjy74jMqdtbV0IxY43ulBMObI7jWMvDjRdR8yQ?=
 =?us-ascii?Q?SidX6198byN5KiF2n6lFg7Ebsh8Z2aOC7js9+/tTKIT+CAcvF6nh1KADyHQ+?=
 =?us-ascii?Q?F2qDCO6YFHAO4WWXalaA3M3zxRuaBGa/6SLA/boQnYYca7WM/DSorSJrPbsO?=
 =?us-ascii?Q?cNICLrqq1hNiHeV0QIAErVaEkwZNmB1YyTb6sKJmTtzhKpI6NBUOo9pXUOOF?=
 =?us-ascii?Q?LeDHO3hqviRy+tg+39zFJPDeyNOlgv67gFWuj2NcfrN47I7jkv5sg/3Rs//T?=
 =?us-ascii?Q?sEuVo/TOkeSPObNx2TLvkzWythII/og914MK4yu3gl1uR/tA5ZNTt+k2TLsL?=
 =?us-ascii?Q?vGX+RzApG/FY4TskLVunjbBxsFgyFzx2Ir/ZhcX4VzvXKTOtp7J+eVg6lFUC?=
 =?us-ascii?Q?DubQIINAtCqu3nCFcSXiVuA1WBKpmp6xN8FmnEXOWJBN5kv61kPlPsnFH+at?=
 =?us-ascii?Q?xEpVcI4sxNEK8w9o6mE6guTi7tneHuRdbxTzeFJQ2nGpeoS8/xGojBeRwfIB?=
 =?us-ascii?Q?kCxLIvoPLtNbDIvY5ue6EooAOwpwq6bPvZpUPng0ByZa2pe6pmW0b3+TJ8A+?=
 =?us-ascii?Q?ct5dofg/Adv4rtrBgENMyzPznLHENmqNNXlAGhtYCFHIFpyB7IBDaH7QNIHX?=
 =?us-ascii?Q?n7G/fCynb/yCeexHqqLyeq3mvX5eNqEz4JDFPH8/isvzdD/mYpTKaXYQhRi/?=
 =?us-ascii?Q?1X6MejLIwoIZQH7zuSEP+YohTl5qyNmU55xL1gzGQmTlHXTq5ZjAoe1K6MuJ?=
 =?us-ascii?Q?pEW+sJv91UHsT9quYqFIxjyJfT5cGiZQX51pE1+JtsOGz9PoDAQgXYh0+MVd?=
 =?us-ascii?Q?Td4y3JsQ1WLZ+Yo30VE1WlAMlbIA4CUuXgKzUyqbHfK76fyIAA6enh6FbJuZ?=
 =?us-ascii?Q?GRbnFx+JYAKWxFnth4o=3D?=
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?us-ascii?Q?jJAR4a1rz5ct7xSxGCTM0z9xea81ksqPItdSy4a0Le6z3/a14r6SzU11i10e?=
 =?us-ascii?Q?2px4P+mfoV+rW0EvATIIulT4wUo2BT830oi9nQpukVhKdPJ8vsZfObi9KpyQ?=
 =?us-ascii?Q?EGnXV7Hcv3AGZRO3cNP67MKTVGPZxIA2XD5EL+x3cE4l/RO6HzvjYwdCj/AR?=
 =?us-ascii?Q?YRzYbClpPG/VBdv0ULqC+LeyjodLwKp43XaKsVdW9DM8XtQB6Yiro7FOlbHc?=
 =?us-ascii?Q?jD/mXPcEDBw2jo9PoRPSRwe/RTm8elAsMMIC5ZpdlCtqk7U1aC2nJcNDLESw?=
 =?us-ascii?Q?ANUsLJwUZyDjAkRDBCY0DW/A+MrGqAiBmo754tLh3N6K7vv61NTosFsHATC+?=
 =?us-ascii?Q?iyAeKlT1A7zLA3n9ZQ2GaoUxAA+uXYDDb3WWLTImMROwo6W6dG3ulurjkIbL?=
 =?us-ascii?Q?kzgypLAyVVber1fgy2CNVBAYuo8Pp7STg177AAJc+XNs78KOKnEOLYKG00XG?=
 =?us-ascii?Q?R46QpqR/euo1Xx4CqRixe2ycU258BAGjW794ZPFofR2vXFkGN1vytK90HOuM?=
 =?us-ascii?Q?EQcZGdQFd89HgJPEitKUuXdXFfkMUYp/vycAX+Le4jibwux3stwmNISR2wu7?=
 =?us-ascii?Q?I+pvFXax8PErAxA7E6RBojvTCc2OBRuYlgm8mvMrI3b5dvDLOAbu6YNCKp0s?=
 =?us-ascii?Q?vfRRIZRTg3QqepeKgAd6IVKBx7OKqDXoDBs7L/f5uy2H6LWKnx6+TKZw4GMW?=
 =?us-ascii?Q?xJ2nMRfndr44iRaxFuLJqo9wXKMCaHKIVXAKJ2JzBGjNRwf3QfiVmBK7H+hV?=
 =?us-ascii?Q?ALX7SmEjNPdVuRmlCetP5Q+zhUSWlxX0/T91it+6j4iXFvxEEc1btqEN3cm1?=
 =?us-ascii?Q?h6ZMu++MN631wjN0lYj79M6sy51SE/UV//czs2H1sj0JuSAxs26BOFfR8zL6?=
 =?us-ascii?Q?0zUOcxajQxIAMy/PsdoFChdUHfVWDTRL5s8J7JiLeyBl3kEpKDnTRgsbzYul?=
 =?us-ascii?Q?eM0rdn9smMXeYwkhPqrlLSAwOkn5yo+CflnkrtjIdzQ=3D?=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR13MB2503.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ac1115-48e0-4562-8db2-08dba4c66b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 17:20:31.7375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMTJzMGol0VlcnVAL+Ws7mJllf9jC04KzmXmIXJWMOW/OmDbDi0QfzLVQKBpOvPTLAYEwo30CuhR4eV8N/+q2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR13MB6090
X-Proofpoint-GUID: Jfao2u8ho2Ojr7VUE3fN-VIYoKEIZ1li
X-Proofpoint-ORIG-GUID: Jfao2u8ho2Ojr7VUE3fN-VIYoKEIZ1li
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Sony-Outbound-GUID: Jfao2u8ho2Ojr7VUE3fN-VIYoKEIZ1li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_13,2023-08-24_01,2023-05-22_02



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> On Thu, Aug 24, 2023 at 10:16:31AM +0200, Linus Walleij wrote:
>=20
> > Since then they come a long way, after a few generations of lost
> > hardware that the kernel never supported properly, Android is
> > pushing the Generic Kernel Image and being more restrictive about
> > proprietary extensions every day. It's going the right way.
> > Todd Kjos at Google and Greg Kroah-Hartman from the community
> > have been instrumental here.
>=20
> I do have some concerns about the effects of GKI on framework
> improvements, by making it difficult for vendors to update any of the
> shared APIs it pushes them into implementing anything they can't get
> from the frameworks in their drivers instead.  This means if they're
> going to upstream things and do the best job possible they'll end up
> working on multiple versions which provides a bunch of stop energy.
> Life will be much easier for vendors if they just worry about their
> specific devices as much as possible.

For an alternative perspective on GKI, I'm not a big fan of it.  The contra=
ctual
nature of the agreement with Google to use it is arguably a GPL violation.
Sony has had experiences where GKI prevented us from making changes
to the kernel to address issues raised in carrier certification, causing de=
lays
and extra (very funky) workarounds, since we couldn't change kernel code
directly.  Google is not very responsive to non-top-tier phone vendors, and
using GKI you are essentially at their mercy.  GKI, for us, removed some of=
 the
value of open source (ie, the ability to modify the source to suit our need=
s).

 -- Tim



