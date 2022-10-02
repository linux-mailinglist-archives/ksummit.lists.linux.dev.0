Return-Path: <ksummit+bounces-862-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B35F254F
	for <lists@lfdr.de>; Sun,  2 Oct 2022 22:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4C90280C12
	for <lists@lfdr.de>; Sun,  2 Oct 2022 20:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047CC3D7A;
	Sun,  2 Oct 2022 20:41:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4653D6A;
	Sun,  2 Oct 2022 20:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0tTRX7JSLjhmGYyY4Aa8Qo+pA+zF+spc9XtjtFIeLHs=; b=tywCWXnUofOAdpE1Qo+ytKB1k0
	RlAzo1YbiA1piiY5o4us5+RjUY/uxWsoiNJaF4bYuEjijbp78kTYsmLQ40YivxLojG+wL6M+5QWHK
	EnlmY7X2xKOuDeEPC1vS7mxM8dfGgziAXzP+iniyhJcvvpjPuR84CF0b77wUWbeI0jQeKllUW9pGP
	ffch266fHrTnKoBpWoDzMfi4tOItvr/AeXwb1IbVJ3OOq3/0BOhOpTT6oUW5zNyU38/qIVOBPJ9ut
	zFzfO91dJ26oAzJYswSz/mZReUGBNITjV2SV4UP2CrJG5OchTHBwBWBJiAv2CDravBKdNJvlhShci
	2iCFIY5w==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:63478 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1of5mD-00A7vP-GJ;
	Sun, 02 Oct 2022 16:41:29 -0400
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
In-Reply-To: <20221002141321.394de676@rorschach.local.home>
Date: Sun, 2 Oct 2022 16:41:25 -0400
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
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
Message-Id: <4F80ED82-BBF1-498F-A093-82506B0EE309@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
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

Hello,

> On Oct 2, 2022, at 2:13 PM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>=20
> Ideally, someone (you?) would want to be a middle man and triage the
> bugzilla reports and find those that look promising to get a fix
> completed, and then be the liaison between bugzilla and the kernel
> maintainer, then I think that could work. But the issue comes back to
> manpower. Who's going to do that?

I *really* like this idea. And I think it=E2=80=99s also worth a shot. =
And if folks think so too, then I think in terms of manpower=E2=80=A6 I =
may have a solution:

I=E2=80=99d be more than happy to step up =E2=80=94 new system or the =
current in-place bugzilla. (Believe me, triaging bug reports is actually =
something I enjoy.) It=E2=80=99d take some time to get adjusted and =
acquainted with dealing with reports, obviously, but I think I'd be able =
to take it on in addition to responsibilities in my personal life.=20

Consider this e-mail as me indicating my interest in stepping up (but =
not a commitment, just yet, I would like to hear from others on Steven's =
idea first.)

Thanks,
-srw=

