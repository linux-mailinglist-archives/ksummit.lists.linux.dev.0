Return-Path: <ksummit+bounces-813-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A645F10FC
	for <lists@lfdr.de>; Fri, 30 Sep 2022 19:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE48B280CF2
	for <lists@lfdr.de>; Fri, 30 Sep 2022 17:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FDE5A87;
	Fri, 30 Sep 2022 17:37:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F75A7C;
	Fri, 30 Sep 2022 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=szezkDrZv/DIxoNhXmXzm3IHUZyWzUBX9UZD4NvKIjU=; b=PhVGZ1A5LidZWBPURz5QMuk8dH
	/sGHgHnqd4P/H8S06hrK2f/1js8wLash+/09h5YDpdVvbR/51/FjJYW54Lh+xYiHWkiB/9YpXTDH4
	36MEFHtlDoTmmoBCj3umIjPcKI7y+OrWou3fAqwobXdzoNc6VS4wQ7gI33GW3mVhPf5tIe/TvQc/p
	DrSqXvC5cupJ6nQpIHQLn/JCzhqfZ/qd5bMX0FouirafFbs7y7s6elSf5Fr0XOHOEeqlm96HhZ65p
	6SZRghEaeTk34ERWtAvg2r87rgpdbI9YixTcKpAMNPn2TlFx7xe4E4T0WCFVD6yHWi2lZ7eUILans
	oNzy4i8g==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:61749 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1oeJwb-008x9c-FO;
	Fri, 30 Sep 2022 13:37:01 -0400
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
In-Reply-To: <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
Date: Fri, 30 Sep 2022 13:36:57 -0400
Cc: "Bird, Tim" <Tim.Bird@sony.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B455C4C1-BECF-4325-B709-8B2C965279DC@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
 <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
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

Artem, all,

> On Sep 30, 2022, at 12:34 PM, Artem S. Tashkinov <aros@gmx.com> wrote:
> Debian uses an email based bug tracker and you know what? Most people
> avoid it like a plague. It's a hell on earth to use. Ubunutu's =
Launchpad
> which looks and feels like Bugzilla is a hundred times more popular.

Yeah, Ubuntu=E2=80=99s Launchpad instance is definitely easier to =
navigate than Bugzilla and has more info at a glance (when looking at =
individual bug reports.) Do I necessarily think they look and feel the =
same? Nah. But, hey, it=E2=80=99s all subjective so it=E2=80=99s cool!

Ultimately I=E2=80=99m conflicted here (even my own opinions have =
already changed twice since I jumped in on the discussion.) Some say =
email is terrible, others say it=E2=80=99s the way they want to do it. =
Because that=E2=80=99s all subjective: that was bound to happen, of =
course. My take is that if the goal is to please *everyone*, we=E2=80=99re=
 not going to get anywhere.=20

Email =E2=80=94 imo =E2=80=94 is good for discussions, but not for =
reporting bugs. Web has upsides of being easier to navigate (sometimes =
faster) with just a few clicks/keyboard shortcuts and some words to =
describe an issue, steps to reproduce, kernel versions it affects, etc.

But no matter what system (email, web, etc.) you use =E2=80=94 there =
will always be things that gets lost, whether that=E2=80=99s because =
someone didn=E2=80=99t see something and/or it got buried by something =
else more urgent. Sadly, that's just going to happen, and the best thing =
to do is improve it so that it=E2=80=99s _less likely_ to do so.

-srw

