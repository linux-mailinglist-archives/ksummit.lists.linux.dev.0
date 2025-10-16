Return-Path: <ksummit+bounces-2548-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE98BE34F9
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BC7B4E4C7E
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C82431D72B;
	Thu, 16 Oct 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A7PJu8tB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34FF2E03E6
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617130; cv=none; b=t4zoBZUJ1QQFmcMFTcLiFPTDgQ3ACiFpcPfaZChOYc98vhTr4K8E41FwVyKEO1K2Oe9Xogz0reQpODfI2DjkPfNymRQoM4BknQiVxa6tr8AzRaQvddSgfT5cvZk8t03IkL0ihnT33nMCOURqxVyeq3eMOE1a0keSAhAbaR/Mack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617130; c=relaxed/simple;
	bh=5frKtB3Pe3Ka00n1d9EElpoNBxAdqPb2Pn6yjxBu19E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP1hBR0g0lZf9xlz53rZlTBNDCo7MwxxggKhgaGE39pkjNkzh3Hq1vFx6ac8J71duVwqA5zIUo8kL00NSfviwSkz9l1brFYDCWJploxALM3bgnou8IZy9mS5EAKh9NxJ8x9EUDMsM4HPj7i0LdnTswnB1VYrgiPXF0EoFXoNt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A7PJu8tB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267B6C4CEF1;
	Thu, 16 Oct 2025 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760617130;
	bh=5frKtB3Pe3Ka00n1d9EElpoNBxAdqPb2Pn6yjxBu19E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7PJu8tB8ruT9zPPEnS29fHrq6fCNIuOXHo+xnXwM2WHYMrTkajVq+qxzZrMZeFSi
	 av3nt20sY6A3nmaW4JQ0zFIvst6k4HARZ0WorgPfEukVZcWTnmwr8Fz/AIiC32jnoo
	 ICC23sthh36oFU6nMTMkHrHMXM8hdTgewDSN6qrY=
Date: Thu, 16 Oct 2025 14:18:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <2025101639-thwarting-press-f0f7@gregkh>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>

On Thu, Oct 16, 2025 at 07:54:01AM -0400, James Bottomley wrote:
> On Thu, 2025-10-16 at 08:57 +0200, Greg KH wrote:
> > On Wed, Oct 15, 2025 at 12:17:27PM -0700, Linus Torvalds wrote:
> > > On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > > 
> > > > (The above script is "tested" in that I verified that yes
> > > 
> > > .. premature 'hit send' situation. That should have said
> > > 
> > >  ..that yes] I verified that it superficially works, but didn't do
> > > anything exhaustive.
> > > 
> > > It was obviously meant as a "look, you can do things like this",
> > > not as a real fully fleshed out solution.
> > 
> > So, to summarize all of this, you are suggesting that maintainers:
> > 	- don't automatically include Link: tags when they don't
> > touch a
> > 	  patch and apply it directly from the email as `b4 dig`
> > will be
> > 	  able to find the patch.
> > 	- if a maintainer does change a patch, add the Link: tag so
> > that
> > 	  people can find the original patch when looking it up
> > later.
> > 
> > Is that correct?
> > 
> > If so, ugh, that just raised the workload of all of us maintainers as
> > now we have to remember to do that second step manually (or through
> > the new git hook, which will NOT work without a network connection so
> > no applying patches from planes or trains).
> 
> I agree with all the complexity.  So why don't we simply have git am
> add message-id to the commit header if it exists in the patch?

Where exactly would that be added?  Are you suggesting that git add a
new atom_type of ATOM_MESSAGEID or something like that?

If so, sure, that works for me, I just want a way to track back a commit
to a message somehow that does not require me to pick-and-choose when I
want to add that reference, as that increases the workload on
maintainers.  Be it a link: or a message-id, or something else that I
can "set and forget" in my git hooks and so can all other maintainers.

Then, sometime in the future, a user is happy that the maintainer "paid
the insurance bill" of adding that reference, so they can look up the
original commit as something went wrong.

Sounds like the networking maintainers also want it, as does drm.  I
think those are the two largest creators of commits in our tree these
days by far.  Luckily staging has died down so I'm no longer in that
category :)

thanks,

greg k-h




That
> way every b4 generated commit will have a message-id header.  No-one
> will ever see it unless they ask for the --pretty=raw (which is what
> tools can do, so they'll all just work) and it is completely mindless
> so everyone always knows what it points to if they want to dig it out.
> b4 dig can even use it as the starting point to find the email.
> 
> Bonus: everyone is forced to use it (because it's built in to git) and
> we always know exactly what it means: no debate about what the target
> of the link should be.
> 
> Regards,
> 
> James
> 
> 

