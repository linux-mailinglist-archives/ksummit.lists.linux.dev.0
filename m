Return-Path: <ksummit+bounces-2521-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5CFBD9F9A
	for <lists@lfdr.de>; Tue, 14 Oct 2025 16:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED302353EC1
	for <lists@lfdr.de>; Tue, 14 Oct 2025 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D255926D4C2;
	Tue, 14 Oct 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOPMB3/O"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55735156F20
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451791; cv=none; b=YUI03uU3bR80+HviR9PJfU/m77NdOCav7jszzZvHgBW6PuJ1EAKFHHw0dsaiGYVJ8F8Zn8PbkwdtY25HvVz7O44EB6JooKoKvEeFsju6q5wZ8L0hbP+4hGhhniNEorHcNWfpT98B12WOJTgIJ3iGuJc5Ea2jgW/R+KDjGxOkENw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451791; c=relaxed/simple;
	bh=18fMEGBAJpUwmApmWAmHdYLgKwvRb8c9dIHQH5EhLz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IINKfSwWmV7zQZkDBXJSQUVvWVTaBVv+sVcDca9MocIsOZ1sIyQWV+VIqgBkHBrEQEvfAG4tQj6PH5Gn1Pa18C7d1UOg4eENS+1kShcO/PuZNZZZ6gWqteZAVBa2qXsgSJ0GtEBcpZ1bXjatA/xxHjaGDKE4j1sAUvoMjbvfjmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOPMB3/O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DE1C4CEF1;
	Tue, 14 Oct 2025 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760451790;
	bh=18fMEGBAJpUwmApmWAmHdYLgKwvRb8c9dIHQH5EhLz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOPMB3/O/qqIo76eud4gI9ZwCivpk/EyZPN1Q6elf/l6vBYpm3BbaQ9s4JJoHpVFu
	 muZ5v2qZZxOCbfesau27uoiulw2LlWpsNS7c9JQYTYcTgfbOAIKh9M/xoMDUIMFjAO
	 P20Vc4VPpk4p1loTrV3lrScTRFcGd3zbkSAMqCwbixz7a72TwunTQLrFmZp9VbHX1E
	 /B2XF9TXI/kgfVZDj1bym/yhZy74CJZTc+mLUrl2lrQINnFFUZC6QPa9vhDJgNno5S
	 dQ2RyZvmoCmNinPAMLVgZNdxlhoNfGEvrzK11jg4tuKFX3HUwBiCKQOz7l7TTP6XxF
	 Vcvj9zMLu4tYQ==
Date: Tue, 14 Oct 2025 10:23:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <aO5czUkGL8R9CTJ5@laps>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
 <18e3d34e-6608-403e-8b85-4873858e9788@suse.cz>
 <CAD=FV=VuJitvt2m-uthmRJYo6JJNTdU5WHXxbZG6-AY0LbfxnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VuJitvt2m-uthmRJYo6JJNTdU5WHXxbZG6-AY0LbfxnA@mail.gmail.com>

On Mon, Oct 13, 2025 at 02:46:31PM -0700, Doug Anderson wrote:
>Hi,
>
>On Mon, Oct 13, 2025 at 1:59 PM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> >> All the other arguments seem just disingenuous in that they literally
>> >> give less useful information than "b4 dig" does.
>> >
>> > Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
>> > yet. ...but I searched and it was easy to find a reference. I'll check
>> > it out. Oh, it's using AI. I guess my suggestion that we should use AI
>> > to solve this problem was more on point than I realized. ;-) ;-) ;-)
>> >
>> > OK, I found Sasha's RFC [1].
>>
>> You found the wrong one. See this one:
>>
>> https://lore.kernel.org/all/20251010-muscular-camel-of-acumen-00eeaf@lemur/
>>
>> But if your point was to demonstrate how searching for a subject can lead to
>> the wrong outcome, good job :)
>
>Crap, that's funny. Yeah, all the top Google searches for "b4 dig" are
>all for Sasha's tool. Konstantin's patch, while landed, isn't in the
>most recent "versioned" b4 release (v0.14.3), so I didn't see it.
>...and yes, it does somewhat prove the point that just trying to match
>on "subject" can be dangerous. I've run into the issue where lore
>pages don't seem to be consistently findable in Google in the past and
>I guess it struck again...

Right - I tried solving a slightly different problem: I don't necessarily care
about the original posting, but I care a lot about any discussions around a
commit (whether they're in the same thread as the submission or a completely
different thread that happen prior to the submission).

So while we can use fuzzy logic like the one "b4 dig" uses, "b4 ai dig" tries
to take it one step further and mine the mailing list for more related
information.

-- 
Thanks,
Sasha

