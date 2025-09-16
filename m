Return-Path: <ksummit+bounces-2402-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA1B7DA44
	for <lists@lfdr.de>; Wed, 17 Sep 2025 14:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D311898CF9
	for <lists@lfdr.de>; Tue, 16 Sep 2025 23:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C6C2D3230;
	Tue, 16 Sep 2025 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRsxaRPu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43092C326A
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758065430; cv=none; b=kAKcVzE/1rsypwqaowN4B3UPvM4TQpCVRa+ycsgt+e/gzNov2c+HZVFlNgZh2Oy2147bbEQHoCOsl4p7BZZxTE5hJKWQVHDjSIePctcVy99Dlvu1I/o25LDCQ1+dAKzeBcDdJgIwe3239vF78D2KCvNl8Gcu04vn//BMeAu85+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758065430; c=relaxed/simple;
	bh=MOKfMQ2MnRt7nMj32wwQwjHuNaePTWUfOZmJnPoCqBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs62mtIpGqrYFiU90mTOdwHNMBOPKlMLT82uozepTLIkpyg5bnL2pJeLRXGqC0mzKgJwdjcPxJBcT32nXVnEKmUV5WjAqg+K8+KbB0RZhDSw/zgNkHq8F4C6K0znrJNPojjPcqeBAgIUX5WK3OlT14piJhwUnOrzaLdr2+ewfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRsxaRPu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E974C4CEEB;
	Tue, 16 Sep 2025 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758065430;
	bh=MOKfMQ2MnRt7nMj32wwQwjHuNaePTWUfOZmJnPoCqBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRsxaRPux5cFBozYi3KL3rBKtk+hN+qkTa6GoFLTTJ7eVvILzcVOUlCUASQMram6j
	 EXFDlimadstVkx+nkM0x9jigtwX85arn/otlFNZCClKsP9yRfw9pOs5hIKhS7NvEd9
	 p2uQLHw5slj48n2t60jPT9cMsGYpyNEX7Q5NhPyYhoqNkQMkK8QXOkjyuzPneuu63E
	 BMoEvvUCaN3XtAl8l+jD8mf21Fgn9ZJTH68D+zNRO7zMds5oDuTIR7lk79GLSrCsZG
	 Emqqr1Y5ZTN+5fEh9hol7r/xKrY+kx70kvefW6ADJxgG4Q838Sc6cYHMMBfP4B0/Yn
	 OFkkklcdXsbwQ==
Date: Tue, 16 Sep 2025 16:30:30 -0700
From: Kees Cook <kees@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <202509161626.AA26A66@keescook>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <202509151019.CD7AA0C0BE@keescook>
 <20250916102022.5bc75a36@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916102022.5bc75a36@gandalf.local.home>

On Tue, Sep 16, 2025 at 10:20:22AM -0400, Steven Rostedt wrote:
> On Mon, 15 Sep 2025 11:01:46 -0700
> Kees Cook <kees@kernel.org> wrote:
> 
> > So, what I mean to say is it's certainly useful to declare "I used a
> > chisel", but that for long running sessions it becomes kind of pointless
> > to include much more than a general gist of what the process was. This
> > immediately gets at the "trust" part of this thread making the mentioned
> > "human understanding the generated code" a central issue. How should that
> > be expressed? Our existing commit logs don't do a lot of "show your work"
> > right now, but rather focus on the why/what of a change, and less "how did
> > I write this". It's not strictly absent (some commit logs discuss what
> > alternatives were tried and eliminated, for example), but we've tended
> > to look only at final results and instead use trust in contributors as
> > a stand-in for "prove to me you understand what you've changed".
> 
> I don't think anyone cares if you used AI to help you understand the
> situation or to test your work. But if you had a robot build you the fish
> and you handed that in as your own work, that would be deceptive.

Right, but the LLMs aren't used strictly as a "workflow" assistant. Do
we want to say "I used the chisel to remove a big hunk of wood you can't
see at all in the fish."

Perhaps the issue is to just over-explain when the LLM is in use for
now, and we (as a developer community) will collectively figure out what
turns out to be unimportant or redundant over time. But this can't be
done with a trailer tag: we're going to need relatively verbose notes
in the commit log.

-- 
Kees Cook

