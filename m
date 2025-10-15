Return-Path: <ksummit+bounces-2532-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EADBE036C
	for <lists@lfdr.de>; Wed, 15 Oct 2025 20:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 075464F7821
	for <lists@lfdr.de>; Wed, 15 Oct 2025 18:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30F3271A71;
	Wed, 15 Oct 2025 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mqR3Y/tA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED41421A447
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 18:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553470; cv=none; b=ZFSO6np2u3xRePaFUMpHgRtNcih7r+1Ju4re6gqqk2xPpN/Fdeb5CM2a29OWado09YvcBkZYQX3f/ZHfyaEv6ea2qCvOgF+/ih5c1j0JVtQlSvlfVz8WsnkpFTfLQwC4WEDqImgJU9/EvVaZdon9SoKm+mseOsbhFBHSFzXt8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553470; c=relaxed/simple;
	bh=tEK2bMWM1tqkVAOlTFQAlITKnotS5llGEa1QKPJnCa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsZWxMidhbIz52ewfNxQQ1k5Q6alAVsGNdtv3YSmvqmeOYXb6hgtJfBoPy9iBKuaBxtUsXwSNV+pS4YCl8zQnC450idb4w6HVri7zAxJH4g6IgJKiXHvZahI23OQxlQXG19UYgs3lmJvoffFjEctbJWrn3yl8RyYPzNmbxQeKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mqR3Y/tA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1ECC4CEF8;
	Wed, 15 Oct 2025 18:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760553469;
	bh=tEK2bMWM1tqkVAOlTFQAlITKnotS5llGEa1QKPJnCa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqR3Y/tAZDwxGiru025udQi3ZTMqprKwvKSN8ZKCA5aG6lbPwOStBSPobItLL1oe2
	 tDV79sNV1Ymgjikv2CrH3uqYLe96gSEjTcjoGwzrC39mstt6hW++Uly2xVmlaJD9nH
	 MNkps00byEpMR4NHH8MTaG0M03rWsGdl1+j+kGYo=
Date: Wed, 15 Oct 2025 14:37:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: dan.j.williams@intel.com
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Doug Anderson <dianders@chromium.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251015-versed-active-silkworm-bb87bd@lemur>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>

On Wed, Oct 15, 2025 at 10:09:33AM -0700, dan.j.williams@intel.com wrote:
> > So unless we have one big "all the notes merged into one" tree
> > somewhere
> 
> ...circling back to say. Why *not* do this?

Git notes are fragile, they have important scalability problems (they are all
just files in a single ref, so if you have a million annotated commits, you
have a million files split across a bunch of two-letter prefixed dirs), and
when multiple writers are editing notes, you will have conflicts and merges.

It's not a great medium for a system that's supposed to be continuously added
to.

I have pondered this multiple times and my preferred approach would be to have
a machine-readable feed that can be indexed and searched. To me, it makes
sense to make it a public-inbox feed that is just RFC-2822 messages, but
that's obviously because I have a large public-inbox hammer. Our transparency
feed operates this way:

https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/plain/m

We could have the same approach with commit annotations.

E.g. if a patch is merged by a submaintainer:

    From: somebot: <...>
    Subject: commit annotation for abcd...7890
    X-For-Commit-ID: abcd...7890
    X-For-Patch-ID: bcde....8901
    References: <some@message-id>
    [other headers like Date, Message-ID, etc]

    ---
    source: pub/scm/linux/kernel/git/subsystem/linux
    link: https://patch.msgid.link/some@message-id
    type: merge
    description |
                Merged by somemaintainer@kernel.org

If it is then merged into mainline:
    
    From: somebot: <...>
    Subject: commit annotation for abcd...7890
    X-For-Commit-ID: abcd...7890
    X-For-Patch-ID: bcde....8901
    References: <some@message-id>
    [other headers like Date, Message-ID, etc]

    ---
    source: pub/scm/linux/kernel/git/subsystem/linux
    link: https://patch.msgid.link/some@message-id
    type: merge
    description |
                Merged by torvalds@linuxfoundation.org

If it is then mentioned in a bug report:

    From: SomeOtherBot <...>
    Subject: commit annotation for abcd...7890
    X-For-Commit-ID: abcd...7890
    [other headers like Date, Message-ID, etc]

    ---
    source: https://bugzilla.kernel.org/bug/12345
    link: https://bugzilla.kernel.org/bug/12345/comment1
    type: bug
    description: |
                 Mentioned in bug 12345 comment 1 as possible source of
                 data corruption in frobfs under high loads.

This is trivial to search for if we're indexing X-For-Commit-ID headers and
then trivial to parse to get a full "medical history" of a commit. Anyone can
clone this and run their own analysis on it using heuristic or AI tools.

This generally goes into my vision of lore as a "message bus" of sorts for
everything to do with Linux development. It's unwieldy for a human, but we're
gradually entering into an era where automated agents are able to efficiently
analyze the firehose and tame it for maintainers. Maybe.

-K

