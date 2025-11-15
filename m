Return-Path: <ksummit+bounces-2611-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FAC60A4F
	for <lists@lfdr.de>; Sat, 15 Nov 2025 20:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9480A4E030D
	for <lists@lfdr.de>; Sat, 15 Nov 2025 19:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CFF3043B7;
	Sat, 15 Nov 2025 19:06:00 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE2137932
	for <ksummit@lists.linux.dev>; Sat, 15 Nov 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233560; cv=none; b=OE0bgGQavI26uy86DPg9XoIcIkw82laWl2bz6XM4nsB7hQA9lKxoLJ5/FFgZMq6Sycw7D59Y9CGIrkeQ/U97LHxgqEdooPaT76ltHJLrUQq6ez/v9QHwuTX4jCKmwk6iN28yjQ8ncbbk+8yqLTfU7mlUqUOQ0pJzV56s89DViwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233560; c=relaxed/simple;
	bh=MP1mkKvUeFAek+Kn2iVDLjzz5rgSGjzpOJV48vnohJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uN1iQimNbdiZU+/6mLtp9cfhprTTLym8teP2VHFEMtnCUd+pjQKjXJmCCHE7JVxcP6qfPpcdiFPkesRZOHcFJh+79uHPPcvdEfW06VW5le8Mc/rZ7HhVwiDeiC7Unu9RRMHgc9eMXPB0cOKmb7ZovXe3tw/pfTkC2jMZhfY6Abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 709271A07EB;
	Sat, 15 Nov 2025 19:05:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id EAC762E;
	Sat, 15 Nov 2025 19:05:52 +0000 (UTC)
Date: Sat, 15 Nov 2025 14:05:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251115140556.44aac254@batman.local.home>
In-Reply-To: <87qztz9v88.ffs@tglx>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<87qztz9v88.ffs@tglx>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 6kko9sokqyia8rrcwfzefzaicr4kgzs9
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: EAC762E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19ywqcy6tExYjj/r2q1knvgesmDXb0qbAQ=
X-HE-Tag: 1763233552-937643
X-HE-Meta: U2FsdGVkX18slMpgPCKKJwMClphLMY6Tw4Rm7n20oU0DLDudD//3TGFaPijyCO3xDZJF5Xj2LBVbd3voNUh2mC4eB2bQK+e4KxqUyB+1kqBMHA9k0onZtgbnHos9rbNrkDGzty7/G/NJdvD1NQDtNS6gZLU3UyHHez+n1Lxkl1H7h7zeac5RfpxJa7vTVdkmR/2ottHbNdlXRDDAKVJp/RHFEEeKUiQZcrKc5K2BgIgWWK4cqLR105Hsr78DYbVG9TMJUQwb41u6pOMi4IOajf7kkB2JReYTAldHJWb9258bwzYZ7YN9BPklo5faktMQ

On Sat, 15 Nov 2025 16:22:15 +0100
Thomas Gleixner <tglx@linutronix.de> wrote:

> > +If in doubt, choose transparency and assume these guidelines apply to
> > +your contribution.  
> 
> Can we pretty please define a tag and format for this?
> 
> I'm not really interested in the creative ways which will otherwise make
> change logs even more incomprehensible.

As Dave responded to Luis, although that is a good idea, it's out of
scope for this document (for now). A patch that adds a tag to
submitting-patches can then update this document to mention it. But
until submitting-patches specifies what tag to use, we didn't want to
mention it in this document.

-- Steve

