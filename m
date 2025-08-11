Return-Path: <ksummit+bounces-2117-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB4B218C3
	for <lists@lfdr.de>; Tue, 12 Aug 2025 00:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF82C1A20275
	for <lists@lfdr.de>; Mon, 11 Aug 2025 22:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA5D21C187;
	Mon, 11 Aug 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh+hJFCt"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9411F0995
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 22:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754952709; cv=none; b=pHMh2NICFkjFUq09USW626e7BC0kCfn8SXQuUNHAXYjIgrvZC2+PBSMVU67WuNPsKbY6LaR/bA3oy95451jI1oVXllLUOwRP0Gz5DXidIQdJFoxB6NoD+WF8wQzPvv6utTZ4C/1d+qbScylpL/GDIX5Dwlj7bcF9UUABSRdPgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754952709; c=relaxed/simple;
	bh=ngSGl7sdibFnNVh7SmMERfbJwy5W+fKrkkEMGvo/+mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFbCDEIXGiLds4/s2J+QzI8Ru4Zp7UvUfyJOBlbDj6ywUioO7E1irIVQkILIs+wEOfkJeErd9CGZxPgXXItgErum1OXqQDnxCgpUm9tZlat2PEHe/aKKpY/XqrsxX1DyaO/AroirRNp5WFrshlH+tbyuE4Gh2e6AXJRCDZLdWn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh+hJFCt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1B6C4CEED;
	Mon, 11 Aug 2025 22:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754952709;
	bh=ngSGl7sdibFnNVh7SmMERfbJwy5W+fKrkkEMGvo/+mw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Eh+hJFCtNJo21QAZsJLlMfDH0PkgwB56N5Md/HV73W8hcF6N189S1TiMorqTyx219
	 Q+n84vA3Hh6i2wReqrG6D7IiO0nBjCG3EBMvXBb8FjQMNGrlWh22inZqR+l/yDT0tN
	 xTke5PZhV+n++q+qIW5QEK2YEhI5xmAyqHB9IbvZR5+dhs4n9BdP9hKApXX/F5k2cb
	 qp29GexgXE3rQGRrNwVmYeL1LK0wS44YbiuO1du00WXvDwmNVLKXEwaVtJRNeeoW6U
	 UFn7xucIaDednDZn6w1ch7cKwL8oN8A1mzkIFx780Sd4dEx+UbSVwDsh4MoQ2qdCPJ
	 vCxECcQB0H6bg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E1EB0CE0965; Mon, 11 Aug 2025 15:51:48 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:51:48 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJpqo48FgDLglg-p@bombadil.infradead.org>

On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> On Mon, Aug 11, 2025 at 02:46:11PM -0700, Paul E. McKenney wrote:
> > depending on how that AI was
> > trained, those using that AI's output might have some difficulty meeting
> > the requirements of the second portion of clause (a) of Developer's
> > Certificate of Origin (DCO) 1.1: "I have the right to submit it under
> > the open source license indicated in the file".
> 
> If the argument is that cetain LLM generated code cannot be used for code under
> the DCO, then:
> 
> a) isn't this debatable? Do we want to itemize a safe list for AI models
>    which we think are safe to adopt for AI generated code?

For my own work, I will continue to avoid use of AI-generated artifacts
for open-source software projects unless and until some of the more
consequential "debates" are resolved favorably.

> b) seems kind of too late

Why?

> c) If something like the Generated-by tag is used, and we trust it, then
>    if we do want to side against merging AI generated code, that's perhaps our
>    only chance at blocking that type of code. Its however not bullet proof.

Nothing is bullet proof.  ;-)

At the same time, I have no idea whether or not a Generated-by tag is
a good idea.

> I'm however not sure if a) hold water. Are folks seriously taking these
> positions somewhere?

I am seriously taking that position for my own work and will continue
to do so until further notice.

							Thanx, Paul

