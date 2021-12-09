Return-Path: <ksummit+bounces-639-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE746E790
	for <lists@lfdr.de>; Thu,  9 Dec 2021 12:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B02E13E0EBF
	for <lists@lfdr.de>; Thu,  9 Dec 2021 11:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82F82CB6;
	Thu,  9 Dec 2021 11:26:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A982C9E
	for <ksummit@lists.linux.dev>; Thu,  9 Dec 2021 11:26:31 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mvHZF-0007qf-9q; Thu, 09 Dec 2021 12:26:29 +0100
Message-ID: <4c3d2b66-2941-bac3-ee9f-d573912ee2aa@leemhuis.info>
Date: Thu, 9 Dec 2021 12:26:28 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-BS
From: Thorsten Leemhuis <linux@leemhuis.info>
To: workflows@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <cover.1639042966.git.linux@leemhuis.info>
Subject: Re: [RFC PATCH v2 0/2] Create 'Posted:' and 'Reported:' tags for
 links in commit messages
In-Reply-To: <cover.1639042966.git.linux@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1639049191;a9551039;
X-HE-SMSGID: 1mvHZF-0007qf-9q

/me grumbles

Stupid me mixed up the the subject when editing, which should read
'Posted:' and 'Reported:', as can be seen from the body of the cover
letter and the subject of v2. Sorry.

/me wanders off to find a place to hide in shame

On 09.12.21 10:52, Thorsten Leemhuis wrote:
> [Preface: sorry, this likely will cause some bikeshedding; but I got the feeling
> I should bring this up, as my Regression tracking bot relies on the Link: tag
> and thus making its ambiguity worse]
> 
> The following patch proposes to create two new tags for stating URLs in commit
> messages. They are meant to make it obvious what provided links are about. This
> is useful for both users and scripts analyzing commits, as right now they have
> no simple way to see what a provided URL is about – they thus have to guess from
> the URLs or follow each one to check.
> 
> The proposed tag 'Posted:' should point to the last public review posting of the
> patch in question, while 'Reported:' is meant to be used for linking to bug
> reports. The 'Link:' tag, which until now covered these two aspects, stays
> around for other kind of links, for example for links to PDFs or webpages with
> background information relevant for the patch.
> 
> This submission partly is triggered by regzbot, my Linux kernel regression
> tracking bot (https://linux-regtracking.leemhuis.info/regzbot/ ). It
> automatically marks a tracked regression as resolved when it notices a commit
> with a 'Link:' pointing to the report of the tracked regression; it also uses
> this to detect when a proposed fix is posted for review. In preparation for this
> I recently improved the kernel's documentation on 'Link:' to the best of my
> understanding in commit 1f57bd42b77c ("docs: submitting-patches: make
> section about the Link: tag more explicit"). I also started pointing out that
> usage to various people when I noticed it was missing. Quite a few developers
> didn't know that 'Link:' was supposed to be like this or completely unaware they
> were supposed to links bug reports. Developers from the DRM subsystem were using
> 'References:' instead; some developer also simply used footnotes.
> 
> Regzbot doesn't need a 'Reported:' and could continue to work as it does right
> now -- with me continuing to educate developers, no big deal. But I wondered if
> I was making the "Link: is ambiguous" problem worse. This lead to this
> submissions, as I always found it a bit confusing that 'Link:' is used for
> different purposes – and hence felt like I should bring this up now, as I then
> can sleep well even if this bolt proposal is rejected. :-D
> 
> Obviously two new tags will force developers and maintainers to adjust habits
> and scripts, so it's nothing that should be done lighthearted. But sticking with
> an ambiguous Link: tag for the foreseeable future might not be the best idea
> anyway, as we live in times where people analyze commits with scripts for
> studies and statistics on reviews and bug reporting.
> 
> For 'Posted:' the change hopefully shouldn't be much work for people anyway, as
> many just need to update their `git am` hook or switch to a hypothetical new
> version of `b4` that was adjusted to place 'Reviewed:' tags instead of 'Link:'.
> It's a bit more of a hassle when it comes to 'Reported:', as some people will
> need to update their muscle memory. But the similarity to the 'Reported-by:' tag
> (to be used in the same situation) should help here; and quite a bit of
> education in this area is needed anyway (see above). And 'Link:' stays around,
> so there is no harm done if it takes the world a while to adapt.
> 
> FWIW, this is already v2, as I sent v1/RFC to workflows list and LKML only to
> test the waters and get some feedback. Due to that I chose to switched from the
> "Reviewed:" tag I proposed in v1 to the "Posted:" in v2.
> 
> Among the feedback I got was also a suggestion from Konstantin, who proposed to
> continue with the Link: tag, but add hashtags after the URL to specify what it's
> about:
> 
>     Link: https://bugzilla.kernel.org/show_bug.cgi?id=215101   #report
>     Link: https://lore.kernel.org/r/fobarbaz.5551212@localhost #review
> 
> This shouldn't break existing scripts, as that is already allowed -- but it was
> hardly used, hence some scripts nevertheless might break. Downsides of this
> approach IMHO are: is easy to forget these hashtags when they have to be placed
> manually (e.g., in the Reported: case), require people to type more, and make a
> line that often is quite long already even longer. But FWIW, it's totally fine
> for me if it's decided to go down that route, then I'll adjust the patch
> accordingly.
> 
> There were also a few suggestions to use tags closer to what users of Git forges
> are used to, but I didn't see anything that would be a good fit. If you know
> something (instead of "Posted:" maybe "MergeRequest:"?), let me know.
> 
> Furthermore, the question came up if we still need the "Reported:" tag if we
> link to the report, as the information is available from the link. I left it, as
> show gratitude to the reporter, which motivates people.
> 
> FWIW, If this bold proposal gets rejected, I'll simply submit the first patch of
> this series to improve the documentation of the status quo.
> 
> Ciao, Thorsten
> 
> ---
> v2/RFC: (this version)
> - split the non-controversial parts out into a preparatory patch
> - s/Reviewed:/Posted:/
> - a few minor changes due to review feedback from various people
> - mention some of the feedback from v1 in the cover letter
> 
> v1/RFC: https://lore.kernel.org/lkml/cover.1637566224.git.linux@leemhuis.info/
> - first, *rough version* to see how this idea is received in the
>   community
> 
> Thorsten Leemhuis (2):
>   docs: 5.Posting.rst: describe Fixes: and Link: tags
>   docs: introduce the commit message tags 'Reported:' and 'Posted:'
> 
>  Documentation/maintainer/configure-git.rst   |  8 ++---
>  Documentation/process/5.Posting.rst          | 37 ++++++++++++++++----
>  Documentation/process/submitting-patches.rst | 22 ++++++------
>  3 files changed, 46 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 065db2d90c6b8384c9072fe55f01c3eeda16c3c0
> 

