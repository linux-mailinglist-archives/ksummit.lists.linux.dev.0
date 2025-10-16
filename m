Return-Path: <ksummit+bounces-2542-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E6BE1D43
	for <lists@lfdr.de>; Thu, 16 Oct 2025 08:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D1AA19C0E58
	for <lists@lfdr.de>; Thu, 16 Oct 2025 06:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CED2F25EB;
	Thu, 16 Oct 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bIfY/IOh"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479E672622
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760597847; cv=none; b=nUEVjBmDZPwjpzdPdOE8Rq1qQrYioE02KgOSMk01EfA64p7eHY/XSQrruRHq5ivU/rrBQfbiFzva1gWCgMMGzOBVjm54B93Xl25Mj0UAzR83IhtpR30Dw/+Iuxm/ya9csHxOlSl0qRpwSCxA/YgunlnlJXDVD7MEqRUC6iR5Pus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760597847; c=relaxed/simple;
	bh=YRIJugu9rNbxZ0adHLi1LC/o38quEWg0jqasRijHCsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzOyxCjImWvJY2QIxMDT7u9nGqkB1Pk/1qhT+tnEaRRREBiUf1uQFcchPnLS22kK9brUDVBymSASPffpj127HgGnQxOMY89xUh+wm25ceUJGnegETU1nX/0Lka+JpvY/RJMmJPRXTSLF+Qat65CJ+tsRC49ZoQy/Ke1WbEmsVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bIfY/IOh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAD5C4CEF1;
	Thu, 16 Oct 2025 06:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760597846;
	bh=YRIJugu9rNbxZ0adHLi1LC/o38quEWg0jqasRijHCsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIfY/IOhNNa5pTmYt6y2mv10XHjV9OIxqlhG48qnPgU2eFTcIIJO8Hc7fmXkhZucP
	 YGmEQGVRfoXNBebb1Af0Lby9DT/zyKLBJ5/C0GU90JzVpAOkdS4mYDQSCHkiZvU944
	 UabCPGjYkVKYNWuJnjolpAYhSrvyP8mToQBPMRWs=
Date: Thu, 16 Oct 2025 08:57:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <2025101631-foyer-wages-8458@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>

On Wed, Oct 15, 2025 at 12:17:27PM -0700, Linus Torvalds wrote:
> On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > (The above script is "tested" in that I verified that yes
> 
> .. premature 'hit send' situation. That should have said
> 
>  ..that yes] I verified that it superficially works, but didn't do
> anything exhaustive.
> 
> It was obviously meant as a "look, you can do things like this", not
> as a real fully fleshed out solution.

So, to summarize all of this, you are suggesting that maintainers:
	- don't automatically include Link: tags when they don't touch a
	  patch and apply it directly from the email as `b4 dig` will be
	  able to find the patch.
	- if a maintainer does change a patch, add the Link: tag so that
	  people can find the original patch when looking it up later.

Is that correct?

If so, ugh, that just raised the workload of all of us maintainers as
now we have to remember to do that second step manually (or through the
new git hook, which will NOT work without a network connection so no
applying patches from planes or trains).

It also puts a burden on the "normal" person here, who took the time to
bisect a kernel bug, found a git commit and then needs to know who to
email about the thing.  That simple, dumb, extra, "Link:" tag provided
that context for them to be able to do that, and no user is going to
want to have to go install b4 to be able to figure that out.

I predict that maintainers are just going to drop the Link tag and not
remember to manually add it back, when touching patches, as that
increased their already-limited workload (and again, prevents from
applying patches without a good network connection).  And overall,
that's going to be a loss in our source history for people trying to
track down problems with changes in there.

The LF, many years ago, funded a tool to go and try to track all commits
back to the email that they came from, and it was a pain to do, and it
almost worked, but no one ever really used it.  But that little Link:
tag, _finally_ added by a huge majority of maintainers, made it dirt
simple for everyone to accurately track back the source of changes and
restart conversations trivially about bugs and issues found by users.

While I appreciate the goal of keeping our changelogs "crap free", I
still think that the "mindless Link: line" benefits far outweigh the
lack of it being there, and forcing us to use additional tools and
server resources, when doing our debugging and patch history tracing
work, which almost all users of the kernel source tree end up doing.

That single line is there for when we don't realize we are going to need
it in the future, think of it as an insurance tax.  It's saved me tons
of hours of time already in doing stable kernel work over the years, and
I'm sure it has helped others out as well, as I'm not alone in doing
backporting work to old codebases.

I'll miss it.

thanks,

greg k-h

