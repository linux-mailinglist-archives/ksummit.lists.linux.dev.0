Return-Path: <ksummit+bounces-779-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB365EF462
	for <lists@lfdr.de>; Thu, 29 Sep 2022 13:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454281C209EA
	for <lists@lfdr.de>; Thu, 29 Sep 2022 11:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A421381;
	Thu, 29 Sep 2022 11:33:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293721116;
	Thu, 29 Sep 2022 11:33:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1odrne-0006cQ-4R; Thu, 29 Sep 2022 13:33:54 +0200
Message-ID: <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
Date: Thu, 29 Sep 2022 13:33:53 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
In-Reply-To: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664451236;7ab0751a;
X-HE-SMSGID: 1odrne-0006cQ-4R

[resent with the right ksummit list in CC]

On 29.09.22 13:19, Thorsten Leemhuis wrote:
> Hi!
> 
> TLDR: Core Linux kernel developers are unhappy with the state of
> bugzilla.kernel.org; to improve things I plan to change a few important
> aspects of its configuration, unless somebody comes up with better ideas
> to tackle current problems: (1) Create a catch-all product making it
> totally obvious to submitters that likely nobody will look into the
> ticket. (2) Remove or hide all products & components where the subsystem
> didn't fully commit to look into newly submitted reports. (3) Change the
> text on the front page to make it clear that most kernel bug reports
> need to be sent by mail.
> 
> I recently brought the state of bugzilla.kernel.org up for discussion on
> the kernel summit and the kernel maintainers summit in sessions about my
> regression tracking efforts. Long story short and rough: in both
> sessions attendees were quite unhappy about the current state and wanted
> things to change for the better. As I brought that topic up, I guess I
> have to get things rolling now.
> 
> But before getting into the details, a quick & rough reminder about the
> current state of bugzilla.kernel.org:
> 
>  * The server and the software running on it are well maintained by the
> the infrastructure team (Konstantin et al.); many thx for this!
> 
>  * Products, components, default assignees, et al. OTOH are heavily
> outdated, incomplete, or wrong: maintaining this is not the job of the
> infrastructure team and nobody else has stepped up to take care of this
> (for a few more details see:
> https://lore.kernel.org/lkml/20220420163223.kz32qomzj3y4hjj5@nitro.local/).
> 
>  * To the best of my knowledge bugzilla.kernel.org was never really
> sanctioned as the official place to report all sorts of kernel bugs:
> only 20 (most of them from the area of ACPI/PM and PCI) out of ~2500
> entries in MAINTAINERS currently tell users to report issues there; most
> other subsystems just mention email contacts, a few (like the DRM
> developers) point reporters to external bugtrackers.
> 
>  * Developers of subsystems committed to the bug-tracker afaics usually
> react to reports submitted in bugzilla.kernel.org. A few other
> developers & subsystems keep an eye on reports, too; some do this
> directly, others rely on bugzilla forwarding reports for certain
> products/components by mail to the subsystem's mailing list. Quite some
> or a lot of tickets are not forwarded to any developer or mailing list
> at all.
> 
>  * In the end lots of bug and regression reports (even good ones!) never
> get a reply from a developer, as a brief analysis of mine showed
> (https://lore.kernel.org/lkml/6808cd17-b48c-657d-de60-ef9d8bfa151e@leemhuis.info/
> ). I at least currently try to work a bit against this by briefly
> looking at each new report and forwarding any by mail that looks like a
> regression worth forwarding (I ignore everything else). Artem S.
> Tashkinov also looks into some (all?) reports and tries to help reporters.
> 
> The sessions on kernel summit and the kernel maintainers summit
> discussed the current state only for a few minutes. It's hard to
> summarize these discussions, but let me try to mention the aspects that
> are important for now:
> 
>  * In both sessions members of the audience seemed pretty unhappy to me
> about the current state of things.
> 
>  * In the kernel summit sessions (recording:
> https://youtu.be/e2SZoUPhDRg?t=5370 ) Len Brown stated that he and
> fellow ACPI/PM developers rely on bugzilla.kernel.org and would need
> some replacement if it's decommissioned.
> 
>  * On the maintainers summit (see the last section of
> https://lwn.net/Articles/908324/ for a brief write-up that coined the
> term "Bugzilla blues") someone brought up the upstream development of
> bugzilla the software seems to be dead; there was not even one strong
> advocate for bugzilla.kernel.org and the general vibe tented into the
> direction of "let's get rid of it". But it was also mentioned that
> bugzilla.kernel.org does something useful which will need a replacement:
> a place where reporters can upload big files needed for debugging problems.
> 
> In the end that made me settle on this plan of action:
> 
>  1. Finding a replacement for bugzilla will take a while, so for now
> let's try to reduce some of its aspects that are bothering people:
> 
>   1a. Create a new product/component that can act as a catch-all bug,
> but makes it pretty clear that nobody might see the report because it's
> not forwarded to anyone. People can use it to upload files for debugging
> and link to them in mailed reports. People unable or unwilling to report
> issues my mail (see 1c) could use it to submit issues, too. The outcome
> then is the same as before, but at least people were told upfront about
> the likely outcome; it also gives users a chance to help each other or
> to coordinate before properly reporting an issue.
> 
>   1b. Go through the list of products and components and hide or remove
> *all* where the subsystem didn't fully commit to look into newly
> submitted reports. Minimum requirements to remain listed will be along
> these lines: subsystem mentions bugzilla.kernel.org in MAINTAINERS or a
> developer listed in MAINTAINERS is one of the default assignees in
> bugzilla. Subsystems where bugzilla forwards mails to a mailing list can
> remain listed as well, if the recent history shows the developers look
> into newly filed bugs. I'll use my best judgment in the transition
> process and will file "anyone listening?" bugs if in a doubt.
> 
>   1c. Make it obvious on the front-page of bugzilla.kernel.org that most
> kernel developers want bug reports to be submitted by mail; mention the
> subsystems that accept reports there and point to the catch-all bug (see
> 1a) as a last straw.
> 
>  2. See if everybody is happy with the new state for the time being; if
> not further fine-tune things or speed up step (3).
> 
>  3. Work out what we want as replacement.
> 
> Anyone any comments on this or helpful ideas how to make things even
> better? Otherwise, I'll in a week or two get down and start working on
> realizing the points listed under step (1).
> 
> Ciao, Thorsten

