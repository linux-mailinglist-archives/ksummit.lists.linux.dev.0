Return-Path: <ksummit+bounces-2536-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A1BE0D0C
	for <lists@lfdr.de>; Wed, 15 Oct 2025 23:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B77273AE7CD
	for <lists@lfdr.de>; Wed, 15 Oct 2025 21:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50E02FCC1E;
	Wed, 15 Oct 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQDlmlpK"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544B2F90C4
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563780; cv=none; b=IMHlLjGfSKfxIcdeavjlAW/pzqVX9zpOATY39LTrWCL8HNpNyf1Bwqgf+tYRqSUilxM9gHojv6aPvAb0ONhchsPfJVBswH0Sd13wyb6BywQpq8M31K9t/Ab4LpS4pq4j9JrHU8L7vWqRJrQ6fzRhjj2NRKdifZg8l63ZbstUxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563780; c=relaxed/simple;
	bh=Jfe0RVlK4T5WeGB6Uwt0deGmZ4QTpwBFdBz3+J+yyZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVn+urIlFrb2VlltevNkHJczysftW81W0bHHN4Cxz7LIZ9XM8f5eA2V3HWel14Dol7iJZCoODvB7HzbIWxuLLC81v8W/1MI8n+zco2SjaMPlxHFZm6WzH8R322UIEX5oy22X8FXBULYbCjwfmWCfQwJ7e0Hiwfd3/ZdbRUlK6wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQDlmlpK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3953C4CEF8;
	Wed, 15 Oct 2025 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760563779;
	bh=Jfe0RVlK4T5WeGB6Uwt0deGmZ4QTpwBFdBz3+J+yyZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQDlmlpKH6HwIkRkpLPbWLa6VZjJ+/KghsDulw31guTK9/HFn0d9nQjYNXcUNq31C
	 wVmufTf6bFTE3EVNdB7hklWKsA9NbEXpDjRG035bNSextC5XR99PUTUYYae08C/2kl
	 hCy9MjGerDVFF53knGhlSBrswNQ9q761lb+ubLhYvP/HYgKPbibTg5H8+9T1hMT6bh
	 mfZFNQ9PGQiEhIk4dM5KcoUfFvyndP9sjUUsQZdf7xIUNsOuOtvDeVe2TQYJH4+pBP
	 NyLWYvuwHTYni6BPBOE0rQl7gOEOpHYQnajiafOnYbFaMFp3risX3bydXqzhSm3pS0
	 Ina1vp+R3hjzg==
Date: Wed, 15 Oct 2025 14:29:39 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Greg KH <gregkh@linuxfoundation.org>,
	Doug Anderson <dianders@chromium.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <202510151425.0E48163@keescook>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>

On Wed, Oct 15, 2025 at 12:15:09PM -0700, Linus Torvalds wrote:
> Look, you can have a .git/hooks/prepare-commit-msg script that looks
> something like this:
> 
>   #!/bin/sh
>   COMMIT_MSG_FILE=$1
>   COMMIT_SOURCE=$2
>   SHA1=$3
>   b4 dig -c "$SHA1" 2>&1 | sed 's/^/# /' >> "$COMMIT_MSG_FILE"
> 
> And lo and behold: you'll find the 'b4 dig' output at the end of your
> commit message as you start editing it.

Perhaps use local git notes (or whatever) for the "b4 am" URL (that would
have been the Link tag), and at commit-msg time (i.e. the above hook),
if "b4 dig" doesn't match that URL, emit the saved Link tag and a FIXME
into the commit msg to describe what changed enough that "b4 dig" didn't
find it and why a Link tag is now justified?

-- 
Kees Cook

