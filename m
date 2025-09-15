Return-Path: <ksummit+bounces-2389-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE5B58433
	for <lists@lfdr.de>; Mon, 15 Sep 2025 20:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986A41AA730E
	for <lists@lfdr.de>; Mon, 15 Sep 2025 18:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18EB242D88;
	Mon, 15 Sep 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oy6hFOzM"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596C22582
	for <ksummit@lists.linux.dev>; Mon, 15 Sep 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757959307; cv=none; b=GtbmwNlby/8HF2vMhiPJdEStFe7O6LYkWAB5Q5rlwsTvPVdRidh3uK3uYfw+Yf9uWdyjr4MLpuh+bEWROBW1nB6JYcUjor5tBI/lQ+vgUKuZytf1gFamKjEH7VvQmkLn9hrK4nDm1JRd8aw1fHXyavp6SuWYOoxWBZ54vR/19qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757959307; c=relaxed/simple;
	bh=Yjnje5RjidlGotMHX+anH2bGpF15m5HnR5vghcQP+Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxTlGNnpJIvh/4MG1DuWS0Hoa6c259BdzwpQU0uUNfI2S4bZVadZWyLO+UpL0MpRJPlUNx+Iucb8ODPtqRpkhA1x8bj7/8SZJwjLk2/y3oTSGbIE5askBazATD41TGJQx5aWavOmxq3r3Tbq1zMnVHkO7QojjmipMGyVo/367Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oy6hFOzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D35C4CEF1;
	Mon, 15 Sep 2025 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757959306;
	bh=Yjnje5RjidlGotMHX+anH2bGpF15m5HnR5vghcQP+Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oy6hFOzMU43SDemRf8hXElUXqvvU0Ca+KTucxtksfgK4afPNFEd+bniuaESsxE5Zx
	 pZ1GQqjIZPtRWk01HqYQtxjbtnMtHhQEpDD+KEc015USPtgbATxeUok7LSf/ci24mS
	 sWPRRbBGWHfI7il8NUThH90kO49AElWVQIFTTUz0kZxVwTLu7sF9dZR3R9pw2Pzxgw
	 v8fkzdHieb7XloacqI6cZu6VE0UIR/6fJsBcjCrz3X64jORePISW4FDUnwFJhcmNyd
	 xWbJAU6TwgmJxPMr5zZAB4cdl6Vl+muxJT2BpuWYyOklL34BzFSg3sUC0Gh5JDmQsM
	 QfDLnmr6cZjmw==
Date: Mon, 15 Sep 2025 11:01:46 -0700
From: Kees Cook <kees@kernel.org>
To: Jiri Kosina <jkosina@suse.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <202509151019.CD7AA0C0BE@keescook>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>

On Tue, Aug 05, 2025 at 05:38:36PM +0200, Jiri Kosina wrote:
> I believe we need to at least settle on (and document) the way how to 
> express in patch (meta)data:
> 
> - this patch has been assisted by LLM $X
> - the human understanding the generated code is $Y

A lot was covered in this thread already, but I noticed that much of the
discussion ended up looking at LLM assistance from the perspective of
"one shot" execution, either as a comparison against other "mechanical"
transformation tools (like Coccinelle) or from the perspective of bulk
code creation ("the LLM wrote it all").

What I didn't see discussed, and where I think there is substantially
greater utility to be had from LLMs, is contributions created during long
running sessions. Such sessions might include more than "just" writing
code, like doing builds, running tests, or helping with debugging (like
driving gdb analysis of kernel crashes). I think this scenario makes
things much more complex to "declare" in a commit log.

(Some examples from me: "security fix I drove the LLM to make"[1], "I
worked interactively with an LLM to construct API testing coverage"[2]
and "I used the LLM to find missed conversion instances and do cross-arch
build and test validation"[3].)

The awkward analogy I have is that of carving a fish out of drift
wood: I picked the wood, and then used a chainsaw, chisel, and knife
to remove everything that wasn't the fish I wanted. Normally only the
final result is shown. For more complex creations, I might describe why
I made various choices. If I'm asked to describe "how I used the chisel"
it quickly becomes murky: it was one of several tools used, and its use
depended on other tools and other choices and the state of the sculpture
at any given time.

So, what I mean to say is it's certainly useful to declare "I used a
chisel", but that for long running sessions it becomes kind of pointless
to include much more than a general gist of what the process was. This
immediately gets at the "trust" part of this thread making the mentioned
"human understanding the generated code" a central issue. How should that
be expressed? Our existing commit logs don't do a lot of "show your work"
right now, but rather focus on the why/what of a change, and less "how did
I write this". It's not strictly absent (some commit logs discuss what
alternatives were tried and eliminated, for example), but we've tended
to look only at final results and instead use trust in contributors as
a stand-in for "prove to me you understand what you've changed".

It seems like a "show your work" approach for commit logs would be
valuable regardless of tools involved. I've been struggling to find a
short way to describe this, though. Initially I thought we wanted to
ask "Why is this contribution correct?" but we actually already expect
that to be answered in the commit log. We want something more specific,
like "How did you construct this solution?" But that is unlikely to be
distilled into a trailer tag.

-Kees

[1] https://lore.kernel.org/lkml/20250724080756.work.741-kees@kernel.org/
[2] https://lore.kernel.org/lkml/20250717085156.work.363-kees@kernel.org/
[3] https://lore.kernel.org/lkml/20250804163910.work.929-kees@kernel.org/

-- 
Kees Cook

