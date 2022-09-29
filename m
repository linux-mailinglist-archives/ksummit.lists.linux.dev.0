Return-Path: <ksummit+bounces-799-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A55EFD81
	for <lists@lfdr.de>; Thu, 29 Sep 2022 21:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32CA31C209A8
	for <lists@lfdr.de>; Thu, 29 Sep 2022 19:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EFF53BB;
	Thu, 29 Sep 2022 19:00:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61653B5;
	Thu, 29 Sep 2022 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eb0khICbQDL4+jyyr8c6E6L4E4XS0/81ahtM8QIqTzo=; b=UrW1D3nlrRLAddd5YLM8QMUKUO
	VJ6k9TO6qjLzi7BhaH49aB3G+Aqk0sS/ySSbtZmvVhxAJbX3JgZ/HO2KlOU4U9xQM/e67XmslWzkj
	ZfxZ6POs9H2CgfQhQvtUm5baBZG5W70OvzoO2oBDSvR23QwlRWZ+L7ORm/RZJsN4MWg6MbKL0DnZT
	cVgq+1PWpnsAfboZ+Hh5IDqejG0gA3hyt0A8M/Ry6FOK/Er5h0iAXnbPiJFFUJ/jONfz9We85iu8i
	8mmH5jR4T6qFAafUvs9tSYEpJVfm5UhXT/X5J5BOZuDwyJyDFw7kmf5BWNRk6pWXBBxPo6sNyDzka
	IuTIUnxg==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:54336 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1odylQ-003C8d-CP;
	Thu, 29 Sep 2022 15:00:04 -0400
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
In-Reply-To: <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
Date: Thu, 29 Sep 2022 15:00:00 -0400
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <49D9FA95-4C73-40BA-A112-93DDFD77D1A2@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hey there,

> On Sep 29, 2022, at 12:42 PM, Laurent Pinchart =
<laurent.pinchart@ideasonboard.com> wrote:
>=20
> E-mails are not that bad to report issues, but they can't provide the
> core feature that any bug tracker oughts to have: tracking. There's no
> way, with the tools we have at the moment (including public-inbox, b4
> and lei), to track the status of bug reports and fixes. Even for =
patches
> we need to rely on patchwork, and that's far from perfect.

Yeah, I (sort of) changed my mind on this [1], but you=E2=80=99re right: =
it lacks tracking issues from reported-to-fixed, and unless something =
was engineered specifically for it, we=E2=80=99re out of luck.

>=20
> I agree with the comment that was repeated multiple times: it's quite
> pointless to improve the tooling if we don't first improve the =
process,
> and find a way to allocate people and time to handling bug reports. =
Even
> if bugzilla has reached EOL upstream, and even if it isn't perfect, =
the
> instance runs today, and gives us a tracker that could be used to =
design
> a proper process and implement it, should we desire to do so. There's =
no
> chicken-and-egg issue to be solved where lack of tooling would prevent
> the implementation of a bug tracking process. I'm quite confident =
that,
> if we manage to implement a bug tracking process, we will find a way =
to
> get the tooling we need, be it through bugzilla or something else.

Right.=20

To be honest, I think the best move from here is improve the process =
first, then worry about everything else when the time comes. Can=E2=80=99t=
 really go any further without first addressing the process in my =
opinion. The important thing to remember is that nothing implemented =
will ever be "perfect.=E2=80=9D That=E2=80=99s just not possible. =
However, we _can_ make something that=E2=80=99ll work and continue =
refining it over time.=20

[1] =
https://lore.kernel.org/lkml/C4935ACC-65C8-4705-B9FF-A1CA0A648B9D@sladewat=
kins.net/

Cheers,
-srw


