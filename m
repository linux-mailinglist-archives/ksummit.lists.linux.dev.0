Return-Path: <ksummit+bounces-1722-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194FA3C5A2
	for <lists@lfdr.de>; Wed, 19 Feb 2025 18:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4F307A83B5
	for <lists@lfdr.de>; Wed, 19 Feb 2025 17:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7508A214211;
	Wed, 19 Feb 2025 17:06:40 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE42862B2
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739984800; cv=none; b=jGajZ1yPuU/53vb9TBjTfi22k69cVQcO9c5U1QVo7nObVE6tWvXBRTEHICJ99P8GL1mAOhCi96+EcqoyCYKv/bTGdslVkAIBogyo9DwQxHAVV8lA2A6loPcNr3vbmqXByq24cT/IpbMP5BYh5tF+4jtEdiHD/bIW6wJ8ExVf0OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739984800; c=relaxed/simple;
	bh=Vwkc4kdAV45hUA3h7Hf6neKlLMmm2gyPbfb7wCifIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYvy5ACWHEIzMlMYTBkRknt2JDbbiYnMxifnXIKR2lAi+Jm1klTmmVIahde0tJ69Dr8P205nkB5IX2yyssyFdL8MiqGn5NXoRB03n/fj2UbhVsPm4gsvgQYir886ntIBaqhfj7Y5dw+c+F03hKmGCdhTE/KhuL2jAgDy6IlwajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-127-146.bstnma.fios.verizon.net [173.48.127.146])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 51JH6NSu022319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 12:06:24 -0500
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id A79B22E011A; Wed, 19 Feb 2025 12:06:23 -0500 (EST)
Date: Wed, 19 Feb 2025 12:06:23 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Christoph Hellwig <hch@infradead.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250219170623.GB1789203@mit.edu>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
 <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
 <CANiq72nnnOsGZDrPDm8iWxYn2FL=wJqx-P8aS63dFYez3_FEOg@mail.gmail.com>
 <a627845f73f2f7bedc7a820cfdf476be9993e30f.camel@HansenPartnership.com>
 <CANiq72m5KB-X1zck1E43yffXOTeD4xRmZgDx_oUiNwR941ce0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m5KB-X1zck1E43yffXOTeD4xRmZgDx_oUiNwR941ce0w@mail.gmail.com>

On Wed, Feb 19, 2025 at 05:44:16PM +0100, Miguel Ojeda wrote:
> Hmm... I am not sure exactly what you mean here. Are you referring to
> Wedson's FS slides from LSF/MM/BPF? i.e are you referring to Rust
> signatures?
> 
> If yes, those signatures are manually written, they are not the
> generated bindings. We typically refer to those as "abstractions", to
> differentiate from the generated stuff.

The problem with the bindings in Wedson's FS slides is that it's
really unreasonable to expect C programmers to understand them.  In my
opinion, it was not necessarily a wise decision to use bindings as
hyper-complex as a way to convince C developers that Rust was a net
good thing.

I do understand (now) what Wedson was trying to do, was to show off
how expressive and powerful Rust can be, even in the face of a fairly
complex interface.  It turns out there were some good reasons for why
the VFS handles inode creation, but in general, I'd encourage us to
consider whether there are ways to change the abstractions on the C
side so that:

   (a) it makes it easier to maintain the Rust bindings, perhaps even
       using automatically generation tools,
   (b) it allows Rust newbies having at least some *hope* of updating
       the manually maintained bindings,
   (c) without causing too much performance regressions, especially
       on hot paths, and
   (d) hopefully making things easier for new C programmers from
       understanding the interface in question.

So it might not be that increasing C safety isn't the primary goal, in
general, one of the ways that we evaluate a particular patchset is
whether addresses multiple problems at the same time.  If it does,
that's a signal that perhaps it's the right direction for us to go.

Cheers,

						- Ted

