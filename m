Return-Path: <ksummit+bounces-2933-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ncO+N7FcM2oT/wUAu9opvQ
	(envelope-from <ksummit+bounces-2933-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 18 Jun 2026 04:49:21 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31369D29E
	for <lists@lfdr.de>; Thu, 18 Jun 2026 04:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wacom.com header.s=selector1 header.b=WGIL5Tdl;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2933-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2933-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=quarantine) header.from=wacom.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9892C3028B5E
	for <lists@lfdr.de>; Thu, 18 Jun 2026 02:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA7B2E7388;
	Thu, 18 Jun 2026 02:49:17 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023139.outbound.protection.outlook.com [52.101.72.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A540D56F
	for <ksummit@lists.linux.dev>; Thu, 18 Jun 2026 02:49:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781750957; cv=fail; b=aPtqKKVCVCRskKG/mXFLBznpHdW2vSDlLILxSvq0RxJiHZ1O59dMxafD6SU7T+R7nr38KRu9/HdMzFolxzZc9uTmVcW/yLWBUPtD67v0sVTNokKfqCX2VU+1JyrlfOIF1FJuXuOZtpp79uij3Mupk4t7WdKuBl/akec32ATytd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781750957; c=relaxed/simple;
	bh=cJReTgr6fW9+EfBzWb++i0OuwdWot0cdSsAFEUlCsbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hVznggSBr7oap+l2yt9qlR+gk9lLBR3oodIFg11/3YZe5naX9HDtpE8q2/polUYsHq2ahaIKWs5bNGA4v4KLn/aD8jszXcf7kkJ1d35xbr24cwmtYSa1hk3HuHdJ5t1iJRk6EzycJMGS1qQLJCgB2sD2lZM4F0NrPpciaJQReZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wacom.com; spf=pass smtp.mailfrom=wacom.com; dkim=pass (1024-bit key) header.d=wacom.com header.i=@wacom.com header.b=WGIL5Tdl; arc=fail smtp.client-ip=52.101.72.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g46bjMahoHABdt6HlXRcKk+8NTA0tGyAWBA0gTsFW6xLj5H7GIYFlVI/LL0rMNU9vsEq4yX3bfDJ2qnpSwi8Mj+j5LPe6vtlrRD6febYGCxjhUS5DaAe12BpdO8ISuPnL6hoqUrDoQxISvLYvFElAg/bJLkjDW1GWc5pqjxjCBNPa/jMm1b7c1x0zcEM650gk787yxYMMznPad60r02MSQLd9yhPn5KJ2HokaLeiWff12Z3ZmotL5DgjmUDfNXKLiTynO481OkMCHHCB6TXjttzjnY+CewG2OWYW6TRciVUKmNIK3tlfs3h6WLnsx6VP0UXna9r50lkmbci2bCEaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJReTgr6fW9+EfBzWb++i0OuwdWot0cdSsAFEUlCsbc=;
 b=RZUzfPD8XKgY83mdU2iBAXDksPX+09ECIgafTHu3qSXopXGCthWzIDcX3xc3mJ+9wIfbPeRbSnDIfGkyvwPQL4zfDQ43jJcTTe32aSFdN7ruu4WlTfAhjA87lUYuVkr9p7EdOxLu7GiIPUTrV2Zmlbt4xXN8DNmsNmdHhjo6fatPB4oS1asITG46U8MZDk0AKZCgR0uvOyBUjsK1+Xxpz9zOpdMocpAlNm4TGSxXKiKgKxtxYObNh7R3te9TQJJoLLFIUW6e0ObqmbkcbYBwyURccRCtsxwdErdqpDf6timHUqGxwETLj7WJ6xjxcvUzhVv1FWu3zfEen1NTrTBqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wacom.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJReTgr6fW9+EfBzWb++i0OuwdWot0cdSsAFEUlCsbc=;
 b=WGIL5TdlZR6p0oPcPjYaP4mUUNGvv/VXcE2UukZLy9TgfJ1VG3wgxunorUAjmjRphdhnLVyEzCumS2q/aF1p+6AfEnNUiwKHoXJtHbqCD1qmle5+d0h3dxXQ8NEl1hHuOed3POlAuDe74JLPL8vDLXXSzSyevIDN2Xqn98hKiqQ=
Received: from GV2PR07MB9153.eurprd07.prod.outlook.com (2603:10a6:150:b5::8)
 by DBBPR07MB7579.eurprd07.prod.outlook.com (2603:10a6:10:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 02:49:11 +0000
Received: from GV2PR07MB9153.eurprd07.prod.outlook.com
 ([fe80::c6f0:ac82:d0f:d8e2]) by GV2PR07MB9153.eurprd07.prod.outlook.com
 ([fe80::c6f0:ac82:d0f:d8e2%4]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 02:49:11 +0000
From: "Cheng, Ping" <Ping.Cheng@wacom.com>
To: Linus Walleij <linusw@kernel.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>, Douglas Anderson <dianders@chromium.org>, Maxime
 Ripard <mripard@kernel.org>, "Gerecke, Jason" <Jason.Gerecke@wacom.com>
Subject: Re: DRM/panel: Bringing Linux DRM Display Panel support in the modern
 age
Thread-Topic: DRM/panel: Bringing Linux DRM Display Panel support in the
 modern age
Thread-Index: AQHc8/2wRR19UP3s+EOQpCsvcz8vVbZDsFVS
Date: Thu, 18 Jun 2026 02:49:11 +0000
Message-ID:
 <GV2PR07MB91531DA61940D34A9F54BB469BE32@GV2PR07MB9153.eurprd07.prod.outlook.com>
References: <0fa2fb42-0714-49f7-ba43-22928e1dd488@linaro.org>
 <CAD++jLnM0VjQ-51MaW49y6-JukcOiV8aZeq2uHy-T+f8mPWOxg@mail.gmail.com>
 <45bfff63-3584-4228-929d-38722f1c564b@linaro.org>
 <6eb7200a-4e5c-4cb3-ad21-85ed9c477338@oss.qualcomm.com>
 <CAD++jLnPP49A6E3hbyR9R6Y7P=Zy1rOHqCztj3uRtDHUfDQBVg@mail.gmail.com>
In-Reply-To:
 <CAD++jLnPP49A6E3hbyR9R6Y7P=Zy1rOHqCztj3uRtDHUfDQBVg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Enabled=True;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SiteId=9655a91b-107e-4537-834e-d15e84872626;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_SetDate=2026-06-18T02:49:10.698Z;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Name=All
 Employees
 (unrestricted);MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_ContentBits=1;MSIP_Label_a19119ff-427d-44d8-8ea3-7850489cd599_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB9153:EE_|DBBPR07MB7579:EE_
x-ms-office365-filtering-correlation-id: 9aec7622-4cac-4b0d-2569-08decce42d0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|38070700021|22082099003|11063799006|56012099006|18002099003|6133799003|4143699003;
x-microsoft-antispam-message-info:
 4bvHGy85wArP1S6W1f9NC/LN2F6oFxZIee1x4xdi/3dUM4Ov69cAsxgLmamTYlqt9NsQwhXxiIdlqLF2JIOmqUG8uROi3+gPMroX4FjipQAQTrL3jFgJl6QpSzLrf0JAxFhB/wnMl/C21fH2lrnxRybb19L3GsLvsbXYBL1NnwcOpkZne4YsfF0goQSoJZ/gQ/N4N3QJY5CuEOk/UYVnAgE/k0qxOkkgye18HwTm6iKew7uuNBn7H7nhzueiztYeN5spDrv8ya+Mj1KiaObUfyzprV5+4H8fSp5JJ5HizCfWz3D6rqrnRgfTvbTJBq/Jl9MhGjJRc61b/3msjLX1PnGFm4/A3LMCvT2gaEw3f8/Xj0gmGV0TPIANPvyhi+Z9Y8Mm5K0pl+4A132HyGMQVGV3uT/474pM54M+/i/tcFIHZ5KhzKWeRWgHamQmwWkTZy6dSHZewZyDiz6jO67QclGcdp6u52k1a/bOlDQXU8UcmbHXsCVZRWbl8CTOJl7lOWPCUTDRUbCK5/X1LOSGhPG4jqKSwJe8+LEONwpfx51WT4o/DQOAcsqRE3afHL77BxmUmGEijkRnd3UfownKrlQ7Z+QN8Sv2M9TVDuxZIjnZRfeVgWRXzFZ69DNsmY6JNRmVRjxZnu//Gn5cWS3d03bdybzJY9z5YDyJ2tiPavJ08EjHbt8vOxWusXriZ4YTnWEeC9YknP718qXArIt/lUsfHrO40uC9VmBRZy1DAq8M316biZB2nsmNFZSWIwLO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB9153.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(38070700021)(22082099003)(11063799006)(56012099006)(18002099003)(6133799003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?56h6HEFjnBkFyKxKJKwVvQ+iCugXLMZO6Dt/T+QhRKh01uzP/jCJb/UiiH?=
 =?iso-8859-1?Q?0RqqmURgEfdAiPEeeerld+i4pDPncO8XAnRHrvIJDx6f21OfUI54CfbBg2?=
 =?iso-8859-1?Q?ciRBz9oqnoF5j96jAxKN2dVztKNlROyTZCftxRtDXEOyyltkhaF6eAfDXp?=
 =?iso-8859-1?Q?8eNppSwzk61S8B8cLFLotJ1RhQns/ukLYsOEJ5/fRTQ+NMggj47LQEuxjM?=
 =?iso-8859-1?Q?2rinzrR09SOC9m4b14CcJ+7gVNutswl/GBJbQXcTV0z74m4x49yp7SV4E+?=
 =?iso-8859-1?Q?ArbFniS7tL57GFVNCm/tRQnEHcd3Kz7dqwWaRAKBhHzsnlxa+kd5C/Yq9o?=
 =?iso-8859-1?Q?9gTkIC/aloEaB6gGJpUZcf8B/KVD9cWkZNIKfjMR/EpERXPaSlWyCa5nL+?=
 =?iso-8859-1?Q?rqGrgWE0qaRBF2pzGoKquHc5ohxZoSfbj5APzHUZnPJa21WCy3eGBUC/tS?=
 =?iso-8859-1?Q?Y/xDeR19GLgRr6FYvHh1W/i2BGwxkrH1nTzvkYfOSq+qfxlhnjCZRyeLxR?=
 =?iso-8859-1?Q?6zCBStr+RYU5ml8A4eHKFv6myuhMaUQhg2BKXGfb70exj6rF7JiZts0zA8?=
 =?iso-8859-1?Q?fbQ9rzKuppds+KDm0yz9IuqOlriJeiLz2ExofOQKCmjaLad/DhkTvzmyc5?=
 =?iso-8859-1?Q?qUoLJllSPpnwd9KsbcvcuyGeIg0qbExDk92vIYj0Snn79qz10m6ZzCRCJV?=
 =?iso-8859-1?Q?H2w9wqqCbu7+Xe//EacLfN5+/9mLGtTyCa1R/BrX3//xGML1UVBw9UccM3?=
 =?iso-8859-1?Q?cgUmdpZvrf3Wlo0R9b0yL0IDzHiR0Bk6e3O0uMHbRuSm0jDkh6Ui/AyjzG?=
 =?iso-8859-1?Q?GJsLF3hNnaogH9DlQXPTgsKykC6o67DxkTF/uIf23HfyfrHB4CYWZIqVzk?=
 =?iso-8859-1?Q?T1FjuU9ugGjnNL5z7i53srEkHLbw4QMw7fugvFelR7sceW7LeG01i1lTpT?=
 =?iso-8859-1?Q?NvlTF488OO/5R2cITq4kTrzulpsbiS/GwaEAlIqvSRxRFBKtYSH9wlCO2D?=
 =?iso-8859-1?Q?hxJ84aDlKy80TvjjHCK4/SP3iLPTqjdkoitsySp0FK1iFef52uiJmc2aot?=
 =?iso-8859-1?Q?P9+uxaf7CAQXWqJhMuFkwQLFixhyB61F+47fTO4KD/xl478M1IQu7BO9xg?=
 =?iso-8859-1?Q?EhXb0l8yBFr3tH4oV/rilUc5NXnoPnr9rUEdbIws6iSuN6OaD4l1ikR8Y9?=
 =?iso-8859-1?Q?ydP8rKS6AKO4rwWwjw1X9tvaTnOUL6Vq0dxKrvODrzGCr4n2xkEEfj2X1W?=
 =?iso-8859-1?Q?oOmwq0OvPU0Cgy/X0fSa9aCYx8TUMQ5iB7+z6mhDnNfi8LcYJwXCWtJ8L1?=
 =?iso-8859-1?Q?woIliEi/SBKoFtSEb9jpu5DIILEFPa5josfFT6qp8pjFOsx0Ch1HFPEWaW?=
 =?iso-8859-1?Q?XlyfWWN3ny3+m5FTGEzwKm2zRDj3daKajN+uJa8Gj9mnFUVxE8u5uLxPuP?=
 =?iso-8859-1?Q?qJzAO8vx5qvSKF3P5LJycB9KULx7suIjnwyEmmvn8OxYoBCkp2qUQTB/R3?=
 =?iso-8859-1?Q?XWZHuzeHOTXEehKRq04l42CpefJdZqlcjKZykVc2w99Wb1VJCBn8Wd/c/q?=
 =?iso-8859-1?Q?wTkWaztkF99h/c6tkHkrYguI9dpy7d9V4O/wa/mF/12S3ZA8NLcwrsbXFR?=
 =?iso-8859-1?Q?BggJI5X7oC5j7wmeebKEIrHcFea1VBwRo6XfuyyNy++Nvt1S2wH8CiOTXe?=
 =?iso-8859-1?Q?XuFeIwf5rByaGmBMNev5Coqu3Iq+V6wjArqg/1viRBlLJVdhOjS5LHoDwe?=
 =?iso-8859-1?Q?44cx/4uKcHL1HEPrZwlAN9ed4A2HgOtNsmkr9DUyV4rVPU9W/ErrPrbl6T?=
 =?iso-8859-1?Q?iH+cO0N6ZJ4YXCeJdcsg7E4vihTX2AJVRtkK5z8ABqPXrRRrFBnp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB9153.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aec7622-4cac-4b0d-2569-08decce42d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 02:49:11.3284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcsUCWN3MtxThRkmOIlZvu+3Hc9J68zzdfrr4h7v5wTpZXV1EPFZtdpUxA51iiR2GpktrUMIStpt/zTmRDKgjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7579
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[wacom.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[wacom.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2933-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[wacom.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Ping.Cheng@wacom.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,linux.dev:email,linaro.org:email,wacom.com:dkim,wacom.com:email,wacom.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A31369D29E

Hi Linus,=0A=
________________________________________=0A=
From:=A0Linus Walleij <linusw@kernel.org>=0A=
Sent:=A0Thursday, June=A04, 2026 1:39 AM=0A=
To:=A0Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>=0A=
Cc:=A0Neil Armstrong <neil.armstrong@linaro.org>; ksummit@lists.linux.dev <=
ksummit@lists.linux.dev>; Douglas Anderson <dianders@chromium.org>; Maxime =
Ripard <mripard@kernel.org>; Gerecke, Jason <Jason.Gerecke@wacom.com>; Chen=
g, Ping <Ping.Cheng@wacom.com>=0A=
Subject:=A0Re: DRM/panel: Bringing Linux DRM Display Panel support in the m=
odern age=0A=
=0A=
> >> Do we have any indication that there is interest from the companies=0A=
> >> actually doing display controllers?=0A=
> >=0A=
> > They mainly speak to panel makers so I don't think they really care.=0A=
>=0A=
>> We have been going through this for all other classes of hardware. What=
=0A=
>> would be the selling point that would make panel vendor learn about the=
=0A=
>> upstream Linux process?=0A=
>=0A=
> The unique selling point would be a vendor that deliver professional=0A=
> equipment and which require full control over the display, i.e. full=0A=
> gamma correction for example.=0A=
>=0A=
> A typical such vendor would be Wacom.=0A=
> These tablets have excellent input device support in Linux thanks=0A=
> to Wacom working for years with the community, but most if not all=0A=
> of their devices these days are panels that you draw directly onto,=0A=
> so they are a panel and an input device.=0A=
>=0A=
> I don't know how much control they have over the deep=0A=
> aspects of the display today, I would expect at least factory=0A=
> calibration but that may be done with separate (non-linux)=0A=
> tooling. But certainly lifetime color correction is something=0A=
> I think they already support albeit possibly with custom tools?=0A=
>=0A=
> Cc to Jason & Ping to check if they have an interest in this.=0A=
=0A=
Thank you for using Wacom as an example. We do care about our customers on =
Linux.=0A=
=0A=
The reality is that display vendors do not share specs with us. We offer a =
solution [1] for our Linux customers based on the ddcutil project.=0A=
=0A=
Cheers,=0A=
Ping=0A=
=0A=
[1] https://github.com/linuxwacom/xf86-input-wacom/wiki/Adjusting-Display-S=
ettings=0A=

