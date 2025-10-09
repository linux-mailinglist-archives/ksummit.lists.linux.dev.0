Return-Path: <ksummit+bounces-2464-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F897BC9A3D
	for <lists@lfdr.de>; Thu, 09 Oct 2025 16:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 853D71891849
	for <lists@lfdr.de>; Thu,  9 Oct 2025 14:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C382EB5CF;
	Thu,  9 Oct 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBM9eKIF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85F2E8B71
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021564; cv=none; b=ZKT9+abpz1UJrOzpdOh7/MXHQt0qgMkxSgwC5cTMO9oYUsEgNiMXBl6fzPR3Xel7I6ztNxZXoj6BnfCghWKWxXGM13JaT24oGP6pPh+VYaGuL+QpJztTTw+DcXh/mgBsZyUJ/FheGDgpD4Fk7MApyGvF5Wlj3Uc034dMZVu9E4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021564; c=relaxed/simple;
	bh=nAe5sgWZriQXsd23kVbaJYT74cg+YroyfCiwbKtoKDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czLSYaPZ6Xcu6XMQZmIm9nnsu1SV6roN8OdFCUYAQ9yml77BsHCXu6kcUDnaEacB7LdKU+h0pXSxSysajJpyTwAsi9O/AZJtmq6vjVtc+iffUtZ1sr55B1VY5BaULfbp7H9dzY3ddYiPTt0KiDWnfUfUXGAMX0hG5eMaNgRL4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBM9eKIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A919C4CEF8;
	Thu,  9 Oct 2025 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760021564;
	bh=nAe5sgWZriQXsd23kVbaJYT74cg+YroyfCiwbKtoKDs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=oBM9eKIFX4da8kJSQ7Pav9RyVhfvXDSTDG2Qhl6nSFHfORu17hXxl+FFKUaOAEoLo
	 o4CPmn+sfrtYI/ELIDT6nLPNyVU2NXHI9/MveJ4fRye81GCb5x5FCrLH6+5JF+mQkI
	 t9tHw23njwRlRHgAoQdc562++1DyVRC5bHDMuFsYXsi7DxEwB3ScbSKEGjxwF18Wez
	 JyUw7nlVOTMNRO4DvmQ1ryoaFf6bDPAF5E+nv/XAk4MJUyWcdFlQJBNbFyoR5cMVja
	 /yccW8yZZ1RRZAUE8qb1KGl1URF1z/OXzS9jU0uGGfwM7ojoFizx29bWNQCdw4R/70
	 6IsEj5mgD+gDw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C5113CE0D18; Thu,  9 Oct 2025 07:52:43 -0700 (PDT)
Date: Thu, 9 Oct 2025 07:52:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chris Mason <clm@meta.com>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <854ab19d-7bba-48ac-b822-77b72e84bee2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>

On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
> Hi everyone,
> 
> Depending on how you look at things, this is potentially a topic for
> either MS or KS.
> 
> One way to lower the load on maintainers is to make it easier for
> contributors to send higher quality patches, and to catch errors before
> they land in various git trees.
> 
> Along those lines, when the AI code submission thread started over the
> summer, I decided to see if it was possible to get reasonable code
> reviews out of AI.
> 
> There are certainly false positives, but Alexei and the BPF developers
> wired up my prompts into the BPF CI, and you can find the results in
> their github CI.  Everything in red is a bug the AI review found:
> 
> https://github.com/kernel-patches/bpf/actions/workflows/ai-code-review.yml
> 
> My goal for KS/MS is to discuss how to enable maintainers to use review
> automation tools to lower their workload.  I don't want to build new CI
> here, so the goal would be enabling integration with existing CI.
> 
> My question for everyone is what would it take to make all of this
> useful?  I'm working on funding for API access, so hopefully that part
> won't be a problem.
> 
> There's definitely overlap between the bugs I'm finding and the bugs Dan
> Carpenter finds, so I'm hoping he and I can team up as well.

Using AI to analyze code and patches seems much safer than using it
to generate actual code.  I asked this AI a couple of RCU questions,
and although the answers were not perfect, they were not half bad.
Especially not at all bad compared to what you would likely get out of
human beings on their first trawl through that code.  ;-)

							Thanx, Paul

