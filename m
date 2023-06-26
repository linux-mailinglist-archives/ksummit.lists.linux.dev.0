Return-Path: <ksummit+bounces-940-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DE73E237
	for <lists@lfdr.de>; Mon, 26 Jun 2023 16:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858A21C2087C
	for <lists@lfdr.de>; Mon, 26 Jun 2023 14:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05F08C1F;
	Mon, 26 Jun 2023 14:34:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2113ED6
	for <ksummit@lists.linux.dev>; Mon, 26 Jun 2023 14:34:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A85C621864;
	Mon, 26 Jun 2023 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687790054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lJyOkDxAXRNbv2NxcrcoNb7uWid/gfphEhoaxk0iS30=;
	b=xoUPL6CoLCuq5r+4h8hB9ost0BwGD/mTgPdcpP1h/t/J4++oJXL6t0zAY7aTG1cL2sqeC4
	3Scxll28SWPhi7eaY0sOmeWiDGKEmkGn89mmbJfr92H2XStuL5xxaagfwfuaQjqYu6OhRS
	KrizIloIZ3jkHQGTbcrnyFXZ1u9WGpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687790054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lJyOkDxAXRNbv2NxcrcoNb7uWid/gfphEhoaxk0iS30=;
	b=HnhT8uLE7zX57cuERjAltbMJUBKCp+l9ADylqDF4omU+hHW/rR1IbR+tlEpbPcspkMzEpB
	Zm1K8SO8c1q8HKBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 999AA13905;
	Mon, 26 Jun 2023 14:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8zpzJeahmWSNCgAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 26 Jun 2023 14:34:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 17270A0754; Mon, 26 Jun 2023 16:34:14 +0200 (CEST)
Date: Mon, 26 Jun 2023 16:34:14 +0200
From: Jan Kara <jack@suse.cz>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Kernel documentation
Message-ID: <20230626143414.d23z5fbwluc3fw7b@quack3>
References: <87fs6rxppz.fsf@meer.lwn.net>
 <2da0858e-3ffb-5096-e8f7-e8c6073a89c0@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da0858e-3ffb-5096-e8f7-e8c6073a89c0@leemhuis.info>

On Wed 21-06-23 13:04:56, Thorsten Leemhuis wrote:
> On 16.06.23 19:48, Jonathan Corbet wrote:
> > The documentation discussion at past kernel summits has been lively, so
> > I think we should do it again.  Some topics I would bring to a session
> > this year would include:
> > 
> > - The ongoing restructuring of the Documentation/ directory.  I've been
> >   slowly moving the architecture docs into Documentation/arch/, but
> >   would like to do more to reduce the clutter of the top-level directory
> >   and make our documentation tree more closely resemble the organization
> >   of the source.
> > 
> > - Structure.  We continue to collect documents, but do little to tie
> >   them together into a coherent whole.  Do we want to change that and,
> >   if so, how?
> 
> I wonder if it we should try to get some external input for these points
> from people with (a) experience in the field and (b) an untainted
> viewpoint. And no, I'm not talking about bringing in McKinsey or
> PricewaterhouseCoopers. ;) I mean people that are not regularly
> contributing to Linux, but have experience with writing docs for
> (ideally large) Open Source projects and/or reorganizing large chunks of
> docs that accumulated in a project over many years.
> 
> Does maybe anyone reading this have ties to someone from groups like
> Write the Docs (https://www.writethedocs.org/)? Maybe someone there
> might have the right experience and at the same time be willing to
> provide us with some input or guidance.
> 
> Or do Linux distributors like Red Hat and SUSE maybe have an interest in
> improving upstream kernel docs, because it might make their work easier?
> If they have at least a little interest, they might be willing to ask
> their docs teams to provide a few ideas for us. And if they care a lot,
> it might even be quite relevant...

I've forwared this email to our documentation team at SUSE if it sparks
some interest :)

> > - Support for documentation work.  There is nobody in the community who
> >   is paid to put any significant time into documentation, and it shows.
> >   How can we fix that?
> 
> ...for this point. Or was this tried already without success?
> 
> Regarding contacting external people for input or help: I met someone on
> two or three conferences that was involved in "Write the Docs", but that
> was years ago and I don't know if that person is still active in that
> space. I also know somebody that at least used to work on docs for Suse,
> but afaik not in the kernel space.
> 
> I could ask those two if that's wanted.
> 
> But I wonder if somebody here has better connections that would be a
> better angle of approach (especially to the docs teams for RH and SUSE).

Well, my feeling is that our doc team is rather overloaded with internal
work (documenting various products, doing translations to various languages
and what not) so they don't have many cycles for upstream work. Also for
the really technical stuff (like kernel APIs), it is often us, the
developers, that initially write say the tuning docs and the doc team then
takes it as a source of information and cleans it up to customer consumable
state ;) So the doc team is not even a direct consumer of the kernel docs
but us developers that try to prepare something for the doc team. Just my
2c about how it works at SUSE...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

