Return-Path: <ksummit+bounces-472-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3123D68D9
	for <lists@lfdr.de>; Mon, 26 Jul 2021 23:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6865F3E0585
	for <lists@lfdr.de>; Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA112FB9;
	Mon, 26 Jul 2021 21:43:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C472
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 21:43:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 313F42008A;
	Mon, 26 Jul 2021 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627335799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-from:
	 resent-message-id:in-reply-to:in-reply-to:references:references:
	 list-id:list-unsubscribe:list-subscribe;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=c13tP0F5rt8JWKnuvC6eHksH0lUXANF7KIWH4C9XN77iMrxnJ9RXqzsv9uH8iJ1qAh6PWJ
	twRLeIUxm052UBtHg2rcL03Agq0mtF8WBsa+EfsJXDcUveLLmDLwbvVxqvBrk5Y7XZiCwL
	SPzWUgvyTkKq0GQRbd93clza0Asv8M8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627335799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-from:
	 resent-message-id:in-reply-to:in-reply-to:references:references:
	 list-id:list-unsubscribe:list-subscribe;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=emancI4Utwu+qn2WM1M6d2VdK1Nl5r/7Rzue4XffDAo1jinqLA9dmsDoIsz1YOz7XGWHbP
	8fE2LUmB4Z+pklCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5596B13B58;
	Mon, 26 Jul 2021 21:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x6l3BXUs/2DtQwAAMHmgww
	(envelope-from <nfbrown@suse.com>); Mon, 26 Jul 2021 21:43:17 +0000
Delivered-To: unknown
Received: from imap.suse.de (195.135.220.8:993) by eli.brown with IMAP4-SSL;
  24 Jul 2021 23:58:06 -0000
Delivered-To: nfbrown
Received: from dovecot-director2.suse.de ([192.168.254.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	by imap2.suse-dmz.suse.de with LMTPS
	id KFxXJIym/GAfZQAAMHmgww
	(envelope-from <nfbrown@suse.com>)
	for <nfbrown>; Sat, 24 Jul 2021 23:47:24 +0000
Received: from dovecot-proxy1.suse-dmz.suse.de ([192.168.254.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	by dovecot-director2.suse.de with LMTPS
	id ENRFCL+m/GD2dAAApTUePA
	(envelope-from <nfbrown@suse.com>)
	for <nfbrown>; Sat, 24 Jul 2021 23:48:15 +0000
Received: from relay2.suse.de ([149.44.160.134])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	by dovecot-proxy1.suse-dmz.suse.de with LMTPS
	id KKSTGNCm/GAONAAAdOEROg
	(envelope-from <nfbrown@suse.com>)
	for <nfbrown@imap.suse.de>; Sat, 24 Jul 2021 23:48:32 +0000
Received: from relay2.suse.de (localhost [127.0.0.1])
	by relay2.suse.de (Postfix) with ESMTP id 845A3A3B88
	for <nfbrown@imap.suse.de>; Sat, 24 Jul 2021 23:47:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at relay2.suse.de
X-Spam-Flag: NO
X-Spam-Score: -0.75
X-Spam-Level: 
X-Spam-Status: No, score=-0.75 tagged_above=-9999 required=5
	tests=[BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
	MAILING_LIST_MULTI=-1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from relay2.suse.de ([127.0.0.1])
	by relay2.suse.de (relay2.suse.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GNZE1bozVjjT for <nfbrown@imap.suse.de>;
	Sat, 24 Jul 2021 23:47:19 +0000 (UTC)
Received: from mx2.suse.de (unknown [149.44.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 17AF6A3B89
	for <nfbrown@imap.suse.de>; Sat, 24 Jul 2021 23:47:19 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTPS id E3818ACFD
	for <nfbrown@suse.de>; Sat, 24 Jul 2021 23:47:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-MaCcAqOcM3yU_HRW8wEybg-1; Sun, 25 Jul 2021 01:47:17 +0200
X-MC-Unique: MaCcAqOcM3yU_HRW8wEybg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK4P202LMEdRx6ogQ6LjyonMLQja5ZVJJrpsYFzxPju3rCNfhgnr18h4yF0IrNcoeQtfuiJXVrjpZySVMmZsy9rERNw/Q/cCwSOQtc1dp0i5XD/KPZsrpIm2FU5hLIj0kRRK74U6SBthqlvWvYDwnvIDK7PUexNx+erk3VuBp3CNY9sg7AQvWSqjPVWqmoJcOg1TeALSUd79tKtQHOm7XQQ30BGmz1oAVi5EMDLCQzPsbzVc6HI075ij5DUUVIuxwzabmk4nfnR16VQ6Fv3fzS+LPPCUQq2/L5oBVKqJTO/f51BnnzPZiz02pyWv1MJ5zs4j7JBnP9y5sJu27v1TRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
 b=X8prMRjqLLplH8gxXfs85DlzN4IXneYYS98EhZh00ybKup0vBrf6bb6jhOvLYblBJhQSM4iTqYvGb1cEcANbb2kAr7AEXrmL0y8W8OULGFIeH7StDvngBraWM64wkH9pQe+d5LT/ElnIizUhsVeTZhQUXuf5+vPJIq1g9X2QqlT3lxB5eXJI+7pt1NZtOVt9VZpCaroO4GxR7+u48FXvG8A3KVB291XJdMIMzHhMso017XAntwhL6iRTixlBaFRLjL/lcBswXj7RztOvdpzmBntdaBgF+G5MAWm8lr9eooK36aExTcAlGk4EVxH6OiZcw9G8D2mCjzLATqDL5DIA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Resent-From: <nfbrown@suse.com>
Received: from AM6PR02CA0030.eurprd02.prod.outlook.com (2603:10a6:20b:6e::43)
 by AM6PR04MB6118.eurprd04.prod.outlook.com (2603:10a6:20b:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Sat, 24 Jul
 2021 23:47:15 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::3c) by AM6PR02CA0030.outlook.office365.com
 (2603:10a6:20b:6e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Sat, 24 Jul 2021 23:47:14 +0000
Authentication-Results: spf=softfail (sender IP is 51.163.159.21)
 smtp.mailfrom=lists.linux.dev; suse.com; dkim=pass (signature was verified)
 header.d=suse.de;suse.com; dmarc=bestguesspass action=none
 header.from=suse.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lists.linux.dev discourages use of 51.163.159.21 as permitted sender)
Received: from de-smtp-1.mimecast.com (51.163.159.21) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Sat, 24 Jul 2021 23:47:14 +0000
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-wQ-qkDYgP22k_kPwU_iXkA-1; Sun, 25 Jul 2021 01:47:12 +0200
X-MC-Unique: wQ-qkDYgP22k_kPwU_iXkA-1
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 440311C0592
	for <neilb@suse.com>; Sat, 24 Jul 2021 23:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E092FB2;
	Sat, 24 Jul 2021 23:47:06 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627170418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=n+T2qW6fSPaPqxRca5o7mooZZn5aDxvz7rXdap/Q/lJPI5EV8UAjRVthba+uz/MM0/I3x5
	UugouPMMsmRYDHMd+Au2gD6Cj/zUgjx4cWB46jGhKscjXXQ1pu2iN37hIUgezD2shIPo/e
	WH/flVxrkanLZPiGL5isdwntRXRqYtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627170418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=/nLiPxpjlAPPlQlQC9H6/jg0hHgGg5BoYV4xttK12vZVJRqqI4/iXjkFRkRiHGaacQDxN/
	6sNsQZhawn3y6XDA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dan Carpenter" <dan.carpenter@oracle.com>, ksummit@lists.linux.dev,
 "Julia Lawall" <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
In-reply-to: <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
References: <20210723191023.GG25548@kadam>,
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>,
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
Date: Sun, 25 Jul 2021 09:45:37 +1000
Message-id: <162717033769.3676.6942299974175827854@noble.neil.brown.name>
X-EOPAttributedMessage: 0
X-EOPTenantAttributedMessage: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba:0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b01594-b57e-45de-be45-08d94efd5d0f
X-MS-TrafficTypeDiagnostic: AM6PR04MB6118:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 	<AM6PR04MB6118A2D45514EB4B94D5724E9CE69@AM6PR04MB6118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	guiD+2WtmK5dN3uW5GeGGG6MSo0KypI7r1aXma7XJdKzxU9Iwt0sPZN8IMkR2uLSBvdzMfUo4xkzenHKGfdyU7LmTqMZwhj0SQKzsVCqdXaURXItWsA826uP7tvZUO7c3hEpbnQg1YTn3kfVds3FFvHUB2DVs1Zze98rqTBFVdCgm7O8igFtVBTstafn3RfadZ2E0Oj9Z/E81Mmc+E3wP3Be1RNd037IeX7PHWvsVcxCsGZRHskrsGA/e5DCCsbOYUhPKExNKU+6HWv7PTkTCI5sJ0o2q6m/rAeCPY0EPp5yQVPWCCcy/iEPGOgtW+MleIcatXVma7UyCPDMd1vNCElmRDkpzA/VPGEC4raY3G58SY9nxwol8rSciMZyOrrULItCeckK0ZZY5AZSTHSsTwyo8WdI5J2G7nS62BinGS/1CD6Kd8T2iD0PyyzTIlGhcbPmIhdZxkcr5SOD4khq36mi5im0q0FyU0BXDZMeITFF3vwqxUwc/UJbhh7HxpoqMn5w+GUK9x6WJrkgiu+jPFG+8ENKHALdc03Y/dW+yWezxFf3eP9NF53ylfoMqz3sE0G8QC8kVTPIwZcUR9MwZ0kZ72hcpEc5ATsmTPGhzSKKr8YnJzuP6V4/mPK9CvMwhYfnD3YcrnCnSMXPvyofEaRqO5nUF1Kh6h8vPuNm3GagvXHuDc3H0/Z9tUrcly4LWKCg7Jlr2oPzHK+pcfVqk7fDPyIwytqX6z5N4EE/s0WDHI3Dcr13+BzR+wwv/ILG
X-Forefront-Antispam-Report: 	CIP:51.163.159.21;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de-smtp-1.mimecast.com;PTR:de-smtp-1.mimecast.com;CAT:NONE;SFS:(376002)(346002)(39850400004)(136003)(396003)(54906003)(34020700004)(4326008)(107886003)(42882007)(498600001)(966005)(9686003)(70586007)(82310400003)(6862004)(68406010)(8676002)(19810500001)(426003)(336012)(82740400003)(53546011)(6666004)(356005)(3480700007)(2906002)(83170400001)(7596003)(26005)(5660300002)(83380400001)(7636003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-ForwardingLoop: 	nfbrown@suse.com;f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 23:47:14.3947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b01594-b57e-45de-be45-08d94efd5d0f
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6118
Resent-Message-Id: <20210724234724.845A3A3B88@relay2.suse.de>
Resent-Date: Sat, 24 Jul 2021 23:47:24 +0000 (UTC)
X-getmail-retrieved-from-mailbox: INBOX
X-Bogosity: Ham, tests=bogofilter, spamicity=0.000000, version=1.2.4

On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> On Sat, Jul 24, 2021 at 03:33:48PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter wrote:
> > > These days we have disabled GCC's uninitialized warnings so it falls
> > > to static analysis devs to review all the new warnings.  I sometimes
> > > ignore warnings if they look like probably they aren't a bug.  Does this
> > > function allow zero size writes?  Does this switch statement really need
> > > a default case?  Maybe sometimes I miss bugs.
> >=20
> > Yeah, I tended to find a few real bugs every release using the good old
> > gcc 4.2, before support for it was dropped.
> > I hope someone still runs modern compilers with GCC's uninitialized
> > warnings enabled again?
> >=20
> > > Here is another example of something which I have a check for but I
> > > haven't pushed.
> > >
> > >         ret =3D frob();
> > >         if (!ret)
> > >                 return ret;
> > >
> > > This code is normally correct but sometimes it means the if statement is
> > > reversed and it should be "if (ret) return ret;".  To me returning a
> > > literal is always more clear but but clearly the original author felt
> > > "ret" was more clear...  It's only a few bugs per year so it's not a big
> > > deal either way.
> >=20
> > To make it work well, you need to know if frob() and/or the current
> > function return an error code or not.  While you can use some heuristics
> > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > indicate if a function returns an error code, or an error pointer?
>=20
> https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboa=
rd.com/
>=20
> I think it would be useful, if not for the tools, at least for
> developers.

Agreed.  I added some code to smatch so that I could annotate pointers to
say if they are allowed to be NULL.  The implementation isn't perfect,
but I love having that extra documentation about when I do or don't have
to check for NULL.

NeilBrown


