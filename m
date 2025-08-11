Return-Path: <ksummit+bounces-2113-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8AB217F5
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8775A623DF0
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB572DAFC5;
	Mon, 11 Aug 2025 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/swsH6+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559D2D47F3
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950309; cv=none; b=PRbyNfx7RJGzjQj/9Lc/KnK6gf3J4jfxY5wwt4riEqdgUPQNpvZwEwkKkhG2uwWw7ekxehUI6vZEYWSNeN9ZkK30pqDtjZNr1bVi+9fGjZ4PJo6wA0sEyfCGrmDKH+8tHb/R7Tn4Ra8i89+2fxHTXipQWzdwl2/BMbp6bUkkFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950309; c=relaxed/simple;
	bh=vjlrc12EaXYsGHvKRZ0m8UzqYE683vGaB66SvPsMNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjcNnfDvCKoGZHqKtWgLegvZv37enb3EuonKWUosVFDOO/5fzuwbIEGOsNZ1v0DcO7Av9kctpiO6Ms8goXc4oYVDuziXHyo6BO4IhEsnRbbHFB0JT4KqomTttmGF5C3NLFZr36raZkBAiDf/ZD5iTb/UTz1ZNsJyu97SPGvyKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/swsH6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2B5C4CEED;
	Mon, 11 Aug 2025 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754950308;
	bh=vjlrc12EaXYsGHvKRZ0m8UzqYE683vGaB66SvPsMNXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/swsH6+JdEHbfuxbFrgybwH44G7u0N6+8fyKf1ddi2awhKvSPmkdyNXyVxT0/ql9
	 QvKXPmimVJCdjCkMa0CVNmbqIbo4tmQPfuAPouaPK0dfAY92KicYWEJzE2ddLlHdOB
	 OVKww3WbdkhO0gyvah+oOwNJVDtifZY+OCEHKwnVXW1c87lqbd5afsphd3rYp7PoP0
	 JOr3VTGm5SlAsZRo2PHvjZghTTNBKen0fzghVy6dMnyofC671jFbdZjVzGgl0YkqEu
	 PH0sxqxblVAZ84yskg0Hl1Q9XmjjdVsMkI/tgJd714kH2AVoCH9cV40aOn7Zv297gI
	 B5On8GrOX3pjw==
Date: Mon, 11 Aug 2025 15:11:47 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJpqo48FgDLglg-p@bombadil.infradead.org>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>

On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
> depending on how that AI was
> trained, those using that AI's output might have some difficulty meeting
> the requirements of the second portion of clause (a) of Developer's
> Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> the open source license indicated in the file".

If the argument is that cetain LLM generated code cannot be used for code under
the DCO, then:

a) isn't this debatable? Do we want to itemize a safe list for AI models
   which we think are safe to adopt for AI generated code?
b) seems kind of too late
c) If something like the Generated-by tag is used, and we trust it, then
   if we do want to side against merging AI generated code, that's perhaps our
   only chance at blocking that type of code. Its however not bullet proof.

I'm however not sure if a) hold water. Are folks seriously taking these
positions somewhere?

  Luis

