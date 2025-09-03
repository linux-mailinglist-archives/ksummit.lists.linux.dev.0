Return-Path: <ksummit+bounces-2294-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83EB424F3
	for <lists@lfdr.de>; Wed,  3 Sep 2025 17:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10983A8A02
	for <lists@lfdr.de>; Wed,  3 Sep 2025 15:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE409221F1F;
	Wed,  3 Sep 2025 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V0Go10nD"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394B1F4C85;
	Wed,  3 Sep 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912639; cv=none; b=SV6Wh++fpDyVgd7RUKGIAiBbr/Y7sQybCv/vX4CZwRcMt4ZphgoNbmhdARjdubNCH/uktkSpj4uUOMUwTKIdyMLJuN5/6b1s2jBqBpSwSMKLcj2MhkDaaW2HZvImY4RiR9Ah5ZoRCT6vQlLN5jcQWrXEJZckeI8VjNXtJe2OTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912639; c=relaxed/simple;
	bh=4hIViWs9ubl5gMoxcG2F9cZKnMShsppwKVliggy1JvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxMGKlmhCcI7nJLv9yf43J/V72xjUpeVGYnOGLlGdfnmBt3wDa2BXXqjZInNCKYhoNAE9wlqKpSTQXm/5wY0tymU1Iu2PrS376w14kk2elI04behlsDMom5DIKjdOfUeV7tZ5ADRJlgnOttr4f9ACz8W0Wby40r04Mik7VSqS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V0Go10nD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610EBC4CEE7;
	Wed,  3 Sep 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756912637;
	bh=4hIViWs9ubl5gMoxcG2F9cZKnMShsppwKVliggy1JvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0Go10nDRC0mIYLlMM9rys/IFoC9MQTmPT1tzMu9escHu4CzBVEiIM94tKWwPvsRH
	 gQpxZtwl0QSGJvmgp3lgdwUw1iYvDc3iHOn9Y4eMfRrIrPTkqa/tXSUQomYd2tyb71
	 7zQ0SkKMfOKx2ouDBCt+p9PWfptT2fZJTmOPC0Gs=
Date: Wed, 3 Sep 2025 11:17:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev, 
	Linux Documentation <linux-doc@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [TECH TOPIC] Kernel documentation - update and future directions
Message-ID: <20250903-nice-loose-koala-2a4bfa@lemur>
References: <xni5csulan6a3kngfw66okhrea2v2u4cwvfkk5vqy5p4xonowf@ajubzphgygit>
 <87ecsox4uy.fsf@trenco.lwn.net>
 <20250902191929.504977bf@foz.lan>
 <87frd4vfys.fsf@trenco.lwn.net>
 <b20224870cd266f93e11ed8ac75c9e77478884eb.camel@sipsolutions.net>
 <20250903124229.332dfeae@foz.lan>
 <431ce4a26d70de6b6d63778e62b732dc035633f9.camel@sipsolutions.net>
 <a88f4cad41b2b0930f2cd486dc6c2ffc64300fa6.camel@sipsolutions.net>
 <xxlm3ozmpel5iadhtambkzfx273oysjraffcizdmgexzhuqtwf@qxkwdvqmbadw>
 <20250903150729.GP3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903150729.GP3648@pendragon.ideasonboard.com>

On Wed, Sep 03, 2025 at 05:07:29PM +0200, Laurent Pinchart wrote:
> This should fail. If you really insist you could print a message telling
> the user there's another Python version on their system that may work,
> but selecting it automatically isn't a good idea.

Just to underline this -- as a systems person, the thing I expect from scripts
is predictability. If I run `python3 --version`, before running a script, I
expect that any script invoking python3 will be using that version. If a
script uses a different version of python without being explicitly told to do
so, it would be confusing and, I expect, frustrating.

-K

