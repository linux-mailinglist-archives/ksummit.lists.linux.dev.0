Return-Path: <ksummit+bounces-796-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECF5EF968
	for <lists@lfdr.de>; Thu, 29 Sep 2022 17:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4171C20A16
	for <lists@lfdr.de>; Thu, 29 Sep 2022 15:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4837539D;
	Thu, 29 Sep 2022 15:47:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940695395;
	Thu, 29 Sep 2022 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rOFIEq0S0Dx55y93OJZ2axvhLBMAn64hF3lTQA7ocec=; b=OGMBcdZ3MXf9Cw8Mdg/YDR00IQ
	7Pp4sb8OLyWNcsHelI/FwskJ6Rs2fu8qN1F2U6uAqe32i+9G06XzZPraa3HtuqiDA0jY1pg7br0yT
	zHkZV7vAbeJo/1bkiGSU0zJXH4vJ9lwuFyFaM5Mn7/bD/SA9Nnb9sopMT3A/vt8qeJ4wqek/ZMYNE
	crO+Bq52Z38eN00KczS7AGJWWNLW5mUcFK31y1p0k7ceCR+p9nufmcfUOGXVzsrSGhH9V3lRJBRA7
	6avKQ2qiC0NaeJlFbgxf7UPTxRyD97QUKJAkdCrZR2aoPAswodXSpPnAjqvsOkJ6iSRl6ntw/5nLt
	h6gxyW3w==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:63979 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1oduvd-00GaOv-NC;
	Thu, 29 Sep 2022 10:54:21 -0400
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
Date: Thu, 29 Sep 2022 10:54:17 -0400
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hey!

Jumping in here to offer my input...

> On Sep 29, 2022, at 10:22 AM, Artem S. Tashkinov <aros@gmx.com> wrote:
>=20
> That leaves us with Bugzilla that no one wants to touch and some =
people
> actively want to delete altogether. In other words, no central place =
to
> report bugs or keep track of them.

This is the current problem that seems to be appearing here. I get why =
no one wants to touch it, but it doesn=E2=80=99t solve the problem.=20

As you said:

> I've mentioned several times already that mailing lists are _even =
worse_
> in terms of reporting issues. Developers get emails and simply ignore
> them (for a multitude of reasons).

It=E2=80=99s 100% true that emails get _buried_ as waves of them come in =
(LKML itself gets hundreds upon hundreds a day, as I=E2=80=99m sure all =
of you know) and it just isn=E2=80=99t something I personally see as =
viable, especially for issues that may or may not be high priority.

> Getting back to my first message in this discussion,
>=20
> * Let's refresh all the components in Bugzilla
> * Components may not have any people responsible for them at all. Bug
> reporters will have to CC the people they are interested in.
> * Let's subscribe the past six months of developers (using git commit =
logs)
> * Whoever wants to unsubscribe is free to do so.

Not a terrible idea to me, though obviously, that=E2=80=99s up for =
debate.

>=20
> If not for bugzilla, let's use something more modern. I don't know any
> comparable projects however. Trac is truly horrible. You cannot even
> unsubscribe from bug reports. Maybe I've missed something. Discourse?
> Not a bug tracker per se but can certainly work this way.

Discourse probably isn=E2=80=99t the best fit here, in my opinion. Jira =
and YouTrack are the only ones I personally know of that are similar to =
Bugzilla, although as far as I know, they aren=E2=80=99t open source...

Best,
-srw


