Return-Path: <ksummit+bounces-885-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2F5F2750
	for <lists@lfdr.de>; Mon,  3 Oct 2022 01:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E0F280A9A
	for <lists@lfdr.de>; Sun,  2 Oct 2022 23:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E3A3D96;
	Sun,  2 Oct 2022 23:59:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE93D8A;
	Sun,  2 Oct 2022 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=komoon+2/7no5tx7nwg6O7hwmQKWGNPBXCcYG4EPcBw=; b=nN1JE3JJUZW92ya1KfgH9Czkza
	hSMsoSTbJARniOageIGCWm/SBvv97vma/kIdOgHEeoTSqx5fmeI4TqMrPjknsOgpN1sg+aMSiRtOS
	J8LPjK9bckueicE3pfDUihGyJxLLRHdW0+R3bb3DEwLsYp74dlmiiASUi2PJaV+0mGtIls3CC0uO+
	WaU0LmUUZIeSFz3AeybaN3tQS2lfXSZwyObcoIG9XwPW1e4tozjjg2x9dGcwgTO8SjkmbgF9Q/q9T
	wy5mqVwemYzFV/SN9X6pAYCh4Oa59hWsjFEHu37YNgttvCYd2YjYTXPZ/B6C0YK7RxtSTJDtb8nqp
	GjSnxuTA==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:64502 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1of8rr-00DM9X-Kz;
	Sun, 02 Oct 2022 19:59:31 -0400
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
In-Reply-To: <20221002181801.25b5ff77@rorschach.local.home>
Date: Sun, 2 Oct 2022 19:59:27 -0400
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Artem S. Tashkinov" <aros@gmx.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev,
 Mario Limonciello <mario.limonciello@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B0853C40-C19A-46D0-B151-84C9016745ED@sladewatkins.net>
References: <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <Yzn9ci/9urgTCF6h@pendragon.ideasonboard.com>
 <20221002181801.25b5ff77@rorschach.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
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

Hi,

> On Oct 2, 2022, at 6:18 PM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>=20
>>=20
>> I believe the same holds true for bug tracking and support. At the =
end
>> of the day, someone will need to pay for it, but we could shatter the
>> traditional model here too. We could, given enough interest, bridge =
the
>> gap between all involved parties and create a support model that =
would
>> benefit everybody. It took years and huge efforts for Linux to evolve
>> towards more professionalism in many areas, and it would take more =
years
>> and more effort to continue and expand that, but I believe it would =
be
>> feasible.
>=20
> Linus went away and came back with git. Should we ask him to go away
> and come back with a better bugzilla? :-D

I mean, we could try and ask nicely, but I=E2=80=99d understand if the =
answer was no, haha.

>=20
>>=20
>> On the topic of triage, I've found that distro developers often do a
>> pretty good job. I've received multiple bug reports of great quality
>> following problems initially posted to distro bug trackers, after the
>> distro developers took the time needed to hold reporters by the hand =
to
>> get all the required information. Kudos for that !
>>=20
>=20
> This is what I was saying about having a liaison. It could work if we
> have someone to do it. We have one volunteer (Slade), perhaps this
> could turn out to be something more.

In all seriousness: I really believe having a liaison who=E2=80=99s =E2=80=
=94 and I=E2=80=99m simplifying these items for right this second =E2=80=94=
 1) gathering information about a report from the reporter (by holding =
their hand through the process), 2) weeding out issues that aren=E2=80=99t=
 actionable or reproducible, and 3) communicating all information to =
developers as clear and concise of a manner of possible will (hopefully) =
result in a better =E2=80=9Cbugzilla=E2=80=9D.=20

Sure, it won=E2=80=99t happen overnight, but I truly believe it has a =
chance (and as you mentioned, I=E2=80=99ve already volunteered to take =
this on and (hopefully) get something off the ground.)

-srw=

