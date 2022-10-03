Return-Path: <ksummit+bounces-911-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F15F371C
	for <lists@lfdr.de>; Mon,  3 Oct 2022 22:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3319E28098A
	for <lists@lfdr.de>; Mon,  3 Oct 2022 20:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1649E29A0;
	Mon,  3 Oct 2022 20:29:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F028E1;
	Mon,  3 Oct 2022 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eakTztduk/2KTShxqBF2G+FBfuHrYom5QVAxjPxCOgU=; b=TMeY8OSocHgYUSgerJTmo2v7AV
	9KvpmauYTeaP0eo2qNarkdgZ9fSp/do6HonVKq53ZLYKoySk6uy+gVyt2cadfXkjayGr10nRsn0X+
	ywxVOecCzLzZ4hRjw84w6PLS8elOqYlFlHusJGb/hTOsk44QYWTni2IKVVLy9Zk3jP7mo9Bux7c2w
	KI480dnTzUM770tRlOu8WNn6VB6/pG2RqFqqK6SakerhTZAJ+O87LEUIn9fTTj7TM1jpatdKJaD9J
	DEp8YYfhGszb4CunwChFPIXHAI8v4166AitELMEVEhvAQ2ZoTz5ZC1ZwcjQmI8nghz/iJKMig9t29
	3UItnZ2Q==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:63594 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1ofS3m-00HAqt-A7;
	Mon, 03 Oct 2022 16:29:06 -0400
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
In-Reply-To: <20221003150708.5f5a409b@gandalf.local.home>
Date: Mon, 3 Oct 2022 16:28:59 -0400
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 "Artem S. Tashkinov" <aros@gmx.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mike Rapoport <rppt@kernel.org>,
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
Message-Id: <4CCE7FAA-D4D1-4D07-A0AC-FDCFE581DD0E@sladewatkins.net>
References: <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com> <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com> <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
 <CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
 <1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com>
 <20221003102029.1fe4f31b@gandalf.local.home> <Yzsox+Q6mKSpQuc6@ZenIV>
 <20221003150708.5f5a409b@gandalf.local.home>
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


> On Oct 3, 2022, at 3:07 PM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>=20
> On Mon, 3 Oct 2022 19:24:07 +0100
> Al Viro <viro@zeniv.linux.org.uk> wrote:
>=20
>> Way more than 800, IME.  And I'm still subscribed to it, even though
>> reading through the damn thing isn't physically possible.  About 1 or =
2
>> percents gets past the "delete unopened" pass...
>=20
> I keep the last 10 weeks in my folder (and archive the rest.) That's =
70
> days worth, and I have 78,109 emails currently in that folder. OK, =
it's
> been a while since I last took the average. It appears to be 1114 =
emails
> per day now. I blame the extra 300 emails a day being the stable =
updates :-D

I keep emails under three circumstances:
1) emails pertaining to whatever window we=E2=80=99re in on mainline. =
Since that=E2=80=99s 6.1, I only have emails pertaining to that.
2) the two most recent stable-rc emails for current stable versions
3) anything I=E2=80=99ve replied to or am Cc=E2=80=99d on

I erase emails each window for number 1, and numbers 2+3 get their =
emails erased after a month of no activity.

But, I do try to at least skim through everything that comes through =
LKML so I=E2=80=99m in-the-know, so to speak. (I know, that=E2=80=99s =
strange, but I=E2=80=99m a fast reader and am very deeply interested in =
it so it=E2=80=99s never been hard for me to keep up on the list.)

-srw


