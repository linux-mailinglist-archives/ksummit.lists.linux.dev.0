Return-Path: <ksummit+bounces-916-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0E5F40A3
	for <lists@lfdr.de>; Tue,  4 Oct 2022 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572531C20953
	for <lists@lfdr.de>; Tue,  4 Oct 2022 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B21290F;
	Tue,  4 Oct 2022 10:16:30 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78839258D;
	Tue,  4 Oct 2022 10:16:27 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ofeyN-0004j4-4w; Tue, 04 Oct 2022 12:16:23 +0200
Message-ID: <409a039b-fd00-a480-ee82-e7a329fa7ae2@leemhuis.info>
Date: Tue, 4 Oct 2022 12:16:22 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Slade Watkins
 <srw@sladewatkins.net>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Artem S. Tashkinov" <aros@gmx.com>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
 <534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net>
 <e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
 <20221003112605.4d5ec4e9@gandalf.local.home>
 <eb935178-995b-84f1-6cbe-3492ba74f85b@leemhuis.info>
 <CAMuHMdWq+NntrPqMHzP3XEvKZgjEwSHW80vwWkZnaTORRrhpHA@mail.gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <CAMuHMdWq+NntrPqMHzP3XEvKZgjEwSHW80vwWkZnaTORRrhpHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664878587;f14536a1;
X-HE-SMSGID: 1ofeyN-0004j4-4w

On 04.10.22 11:20, Geert Uytterhoeven wrote:
> Hi Thorsten,
> 
> On Tue, Oct 4, 2022 at 10:41 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> But I consider explaining things like bisection and localmodconfig in
>> the documentation as also important, as that's likely something the tool
>> won't be able to automate any time soon (or never, as realizing that is
>> likely hard and better left to a separate tool anyway).
> 
> Creating a simple Linux-specific wrapper around git bisect under
> scripts/ might be useful?
> The wrapper could copy .config to
> $(srctree)/arch/$(ARCH)/config/bisect_defconfig, automatically run
> "make bisect_defconfig" in each step, and show not only the bisected
> commit, but also the impact on .config.

Don't worry, I still remember that trick of yours from this discussion:
https://lore.kernel.org/all/12e09497-a848-b767-88f4-7dabd8360c5e@leemhuis.info/

Something like that would be a start, but I'd say having localmodconfig
covered would be wise also, as it speeds things up tremendously for
those that start with a full-blown x86 pc distro config.

There are also people that find regressions when updating from say
v5.18.15 to v5.19.4 and want to bisect that range; never tried if that
actually works with a stable git tree, but I'd assume that approach is
unwise. I also assume a lot of people would prefer to download only the
recent history or specific stable branches when cloning the git tree
(which is possible if you know what to do, but I guess most people don't).

Ciao, Thorsten

