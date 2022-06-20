Return-Path: <ksummit+bounces-675-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F77F551D73
	for <lists@lfdr.de>; Mon, 20 Jun 2022 16:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 0E7B92E0A52
	for <lists@lfdr.de>; Mon, 20 Jun 2022 14:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE062565;
	Mon, 20 Jun 2022 14:08:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B55A57
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655734096;
	bh=Fm4HoeluZwDETirmB+A1XijW3x1dmLOjz2POrJEbZlw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=MjqoIKXeqA86iErI/CRo8MEg589bbmmEBd4zBvuf5G+ZpNMDs7Ph+wwOrOt4eI3PN
	 JiIR4tYZtBnOXnCporEiMKkHgewhFCnp2GqZsFtmoca+HsgQamFz5PweWd2/h6PEzL
	 fIvt+lCyst/Mzpbxczl8EU3UQJ/UfJEw6VUviWEg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B82B712868BB;
	Mon, 20 Jun 2022 10:08:16 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yptvd-DBcGHz; Mon, 20 Jun 2022 10:08:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655734096;
	bh=Fm4HoeluZwDETirmB+A1XijW3x1dmLOjz2POrJEbZlw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=MjqoIKXeqA86iErI/CRo8MEg589bbmmEBd4zBvuf5G+ZpNMDs7Ph+wwOrOt4eI3PN
	 JiIR4tYZtBnOXnCporEiMKkHgewhFCnp2GqZsFtmoca+HsgQamFz5PweWd2/h6PEzL
	 fIvt+lCyst/Mzpbxczl8EU3UQJ/UfJEw6VUviWEg=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D798712868B4;
	Mon, 20 Jun 2022 10:08:15 -0400 (EDT)
Message-ID: <c60b633ccb4e0e10d292cd8a00ef217d6a6cc5bb.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Date: Mon, 20 Jun 2022 10:08:13 -0400
In-Reply-To: <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	 <Yq6+p+aRCjeZ7QsS@infradead.org>
	 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
	 <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2022-06-19 at 21:08 +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Sun, Jun 19, 2022 at 3:49 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Sun, Jun 19, 2022 at 08:56:46AM -0400, James Bottomley wrote:
[...]
> > > I really doubt anyone at the maintainer or reviewer level of the 
> > > kernel doesn't have the ability to learn rust (now whether they
> > > have the desire to is quite another matter) and I'd be surprised
> > > if we can find any kernel developer who only speaks C.  I think
> > > the biggest problem with rust is that there's definitely an anti-
> > > C bias in the language. What I mean by that is if you look at
> > > Java they chose to be as close to C where possible to make the
> > > language easier to learn.  Rust seems to have taken the opposite
> > > view and picked a lot of things which could have been C like
> > > (typing, function calls, returns, mutability, etc.) and done them
> > > differently just because they wanted to be different from
> > > C.  That does cause issues for C people because you tend to trip
> > > over the anti-C biases in the language and are constantly having
> > > to look the basic syntax up.  This really increases the learning
> > > curve going from C to rust, which gets annoying very fast, but
> > > it's not insurmountable.
> > 
> > Time to invent a C-like version of rust ? :-) Jokes aside, as far
> > as I understand the syntax is different from C because it was
> > inspired by other languages, not out of a desire to be anti-C. I
> > could be wrong though, and it doesn't really matter anyway, I doubt
> > there's anything we could do there.
> 
> When reading "things which could have been C like", I had the exact
> same thought ;-)
> 
> In the past, many new paradigms were implemented in a variety of new
> languages, usually inspired by other languages (e.g. some looked like
> C, others like Pascal).
> 
> At the risk of sounding too procrastinating (perfect is the enemy
> of good, and see James' thread about becoming too fearful...),
> perhaps it is wise to question if Rust arrived too soon, and a more
> C-like language implementing the same safety paradigms is just around
> the corner, or already in its infancy?

I'm not really sure we should wait.  The problem caused by the anti-C
biases in Rust is merely an increase in the hump you have to climb to
get a handle on the language.  As I said above, it's annoying, but not
insurmountable.  I don't think we have to wait for an easier language
for C programmers to come along to begin the Rust experiment.  Assuming
the experiment has mixed results, and that's due to people not getting
over the learning hump, we can always adopt a more C like memory safe
language later, assuming one comes along.

James



