Return-Path: <ksummit+bounces-910-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4E5F3619
	for <lists@lfdr.de>; Mon,  3 Oct 2022 21:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78CF3280A7F
	for <lists@lfdr.de>; Mon,  3 Oct 2022 19:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9864C28EE;
	Mon,  3 Oct 2022 19:07:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C823CD;
	Mon,  3 Oct 2022 19:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4B7C433C1;
	Mon,  3 Oct 2022 19:07:07 +0000 (UTC)
Date: Mon, 3 Oct 2022 15:07:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Mike Rapoport <rppt@kernel.org>, Theodore Ts'o
 <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>, Greg KH
 <gregkh@linuxfoundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003150708.5f5a409b@gandalf.local.home>
In-Reply-To: <Yzsox+Q6mKSpQuc6@ZenIV>
References: <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
	<20221002180844.2e91b1f1@rorschach.local.home>
	<3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
	<YzoY+dxLuCfOp0sL@ZenIV>
	<b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
	<YzqjfU66alRlGk5y@kernel.org>
	<251201be-9552-3a51-749c-3daf4d181250@gmx.com>
	<CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
	<1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com>
	<20221003102029.1fe4f31b@gandalf.local.home>
	<Yzsox+Q6mKSpQuc6@ZenIV>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Oct 2022 19:24:07 +0100
Al Viro <viro@zeniv.linux.org.uk> wrote:

> Way more than 800, IME.  And I'm still subscribed to it, even though
> reading through the damn thing isn't physically possible.  About 1 or 2
> percents gets past the "delete unopened" pass...

I keep the last 10 weeks in my folder (and archive the rest.) That's 70
days worth, and I have 78,109 emails currently in that folder. OK, it's
been a while since I last took the average. It appears to be 1114 emails
per day now. I blame the extra 300 emails a day being the stable updates :-D

> 
> Speaking of private mail... there's one case when it's warranted -
> a bug that looks like a sufficiently nasty security hole in something that
> would be sufficiently widely deployed.  Preferably - with something along
> the lines of "off-list due to potential security impact".
> 
> Still a matter of taste - security@ is an option for those...

I was about to say "then include the security@ mailing list". ;-)

It's still not a private one. But for those that do not know about that
mailing list, yeah, private is fine. But that's not really the focus of
this discussion.

-- Steve

