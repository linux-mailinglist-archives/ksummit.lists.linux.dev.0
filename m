Return-Path: <ksummit+bounces-976-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A377CF94
	for <lists@lfdr.de>; Tue, 15 Aug 2023 17:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E2D28147E
	for <lists@lfdr.de>; Tue, 15 Aug 2023 15:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE48A15490;
	Tue, 15 Aug 2023 15:51:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686113AD9
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 15:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84998C433C7;
	Tue, 15 Aug 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692114686;
	bh=8QqVIxskq5U24+vgzkpgJR/Y7wzTVQGVnLpug/z0ENE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/fQKjwctrpFE2JFcr/2q4oghvLbgSAtudxqYvO/ELZuFjH0KYdUwEI9I60/jANsX
	 iMSsOcQfh5NFFMIst3pr6+jWZ6SCRVBRIKz/+8O0f+0k8fepICHtMG7hq/VA7bxS5M
	 IWqTnOfEaR4deN79NE49LRvDbqwoJmmwjBHhsgVQ=
Date: Tue, 15 Aug 2023 17:51:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Jiri Kosina <jkosina@suse.cz>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <2023081545-freezable-whiff-0cf3@gregkh>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <ZNuJkCHnaCb95zj/@arm.com>
 <2023081553-deodorize-crumpet-ee9a@gregkh>
 <20230815110422.2366cc0b@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815110422.2366cc0b@gandalf.local.home>

On Tue, Aug 15, 2023 at 11:04:22AM -0400, Steven Rostedt wrote:
> On Tue, 15 Aug 2023 16:41:37 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > Loads of companies/governments have been pestering us for access to
> > security@k.o for decades now, this isn't going to change for the obvious
> > reason that having such groups on the list is not going to help us fix
> > any problem, but instead, just give everyone early access to known
> > security problems.
> > 
> > Same thing would happen for any potential distro@k.o list, remember who
> > some of the largest users of Linux is (i.e. governments) and many of
> > them have their own custom "distros" for their systems for valid
> > reasons.
> > 
> > So no, we can't do that if you care about security overall, this would
> > make things insecure.
> 
> Even if the only thing that is shown is a commit sha that should be taken?

I provide a list of all of those commit sha in every release today.

You sound like someone in a meeting I had many years ago at a "big chip
company", the conversation went something like:

  Security Manager - "Just tell us which releases in every stable
  release you make that fix a security bug."
  Me - "I can't do that as that would imply we have audited every commit
  to determine if they are, or are not, a security fix, and so you would
  have a false sense of security if you don't take all of them."
  SM - "But I don't care about any unknown security fixes, I only want
  to know the known security fixes!"
  Me - "You will then have insecure systems when it is determined later
  that those other fixes were security fixes."
  SM - "I don't care about future security issues, I only want to know
  about known ones now!"
  Me - "..."

Luckily a VP stepped in then and said, "The community is giving you a
set of known bugfixes for all issues that they know of at the moment,
for free, why are you refusing to take all of them and insisting that
they do more work for you for free so that you can have a more insecure
system?"

And yes, this company is not using a distro at all, they have their own
"releases" based on the kernel.org tree.  And they are HUGE, one might
argue much bigger users of Linux than many of the "enterprise" distros
are on quantity of Linux systems in use.

So again, what's preventing you from just taking all published fixes?
Android does this, are your systems somehow more special than Android,
the largest user of Linux by far in the world?  :)

Also, to further drive home this issue, a "big car manufacturer" a few
years ago told me, "we now have a team of developers that are going to
audit every stable kernel commit to determine if it is, or is not, a
security fix for our systems before we will take it."  They did this for
about a year and came back saying "we could not keep up with the flow at
all, and everytime we guessed wrong, we put the security of our systems
at risk.  It ended up being cheaper, and safer, to just take all of the
fixes."  Which they now do.

So, why are you refusing to do the cheaper (from a business point of
view), and safer (from a security point of view) and not just take all
of the fixes we provide?

Again, the Google security team proved that taking the stable kernel
releases fixes 90%+ of all known security problems in their systems
BEFORE they are known!  They analyzed all of the data on this for 2
years straight and published their results before they just gave in and
said "just take them all, to not do so is crazy".

(the 10% not fixed were attributed to out-of-tree code that was not
upstream yet, nothing we can do about that...)

And yes, I'm arguing strongly that the old model of the "enterprise
kernel releases" is wrong.  So much so that I fail to understand that if
Android can provide a secure, up-to-date, internal ABI STABLE, kernel
based on the LTS releases, why can't these enterprise distros do the
same for their customers?

And I think Oracle does do this for their enterprise kernel releases,
which is nice to see.  Yes, I'm saying more people need to be like
Oracle and Android, what is the world coming to... :)

thanks,

greg k-h

