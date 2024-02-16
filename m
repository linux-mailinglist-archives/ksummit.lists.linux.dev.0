Return-Path: <ksummit+bounces-1208-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01BD8583DE
	for <lists@lfdr.de>; Fri, 16 Feb 2024 18:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6ECB285C6B
	for <lists@lfdr.de>; Fri, 16 Feb 2024 17:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE75131725;
	Fri, 16 Feb 2024 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CcYgeRC4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2KhdWyn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CcYgeRC4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2KhdWyn"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70172130E2F
	for <ksummit@lists.linux.dev>; Fri, 16 Feb 2024 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103673; cv=none; b=gRj5wfMHag4EXXQqVWaf4xUKYPCz/EzGoh3KsFyAj+8ETD9k+UeJAj3VrZ4JWQKY5dtt/19OeBuXN98tv2VJ2q3MFXBzsXrieX0AqP9ftZlqzRyor/sK1WSHhXugXMin8JrjM2jZS2jwbB4ggjJ/K4J8OlkX48ZJI8+Iu1HxHBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103673; c=relaxed/simple;
	bh=P2uoxR+j8AhYlCQShrKhZ+Njr/5Q634qhA/PPXPNjIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1wXB3hOdig0ulVlbMBfJIKjtRtjhgDRRCtmJ+CHPJthTxeBCLFvkWfJZo76AD/9pkVOgGP62p8Zgx+LkYYo8BVZr5R6LLmrIQvYFCACVmVJjWGbfQxIh7ABUIUGsJKBK3dktaDBJ1o+DCTzzSUwuD+A4SHC+yac6+7sH1boRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CcYgeRC4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2KhdWyn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CcYgeRC4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2KhdWyn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B8C51FB70;
	Fri, 16 Feb 2024 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708103668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aI2W0/CXxt2Z5lFJjIfLOS3SFEuFXQe3z13S4ExoDO0=;
	b=CcYgeRC4C34Cc4WlhBQdN0s7VuHGynnhgXFt089SNK/wNQCAeDWDsvrIoClxuH/QVyeTfL
	fwkBGI/rpi9nsTCmX6TchirXfl0QLsJ+jsWgukGtGtAqQWmuMA05oNO+SGsE3rgT9ilsvF
	yRwK/Kv2ZH7+6gO98l0gA72uouSLBks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708103668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aI2W0/CXxt2Z5lFJjIfLOS3SFEuFXQe3z13S4ExoDO0=;
	b=P2KhdWyn7kKvJDXL66ogEq2pLAbGu6WYwj0Il3+eY0m9cQNJ9VctPScIqyku1yhU2sTto0
	X/sdQYuIrJ0gxOBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708103668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aI2W0/CXxt2Z5lFJjIfLOS3SFEuFXQe3z13S4ExoDO0=;
	b=CcYgeRC4C34Cc4WlhBQdN0s7VuHGynnhgXFt089SNK/wNQCAeDWDsvrIoClxuH/QVyeTfL
	fwkBGI/rpi9nsTCmX6TchirXfl0QLsJ+jsWgukGtGtAqQWmuMA05oNO+SGsE3rgT9ilsvF
	yRwK/Kv2ZH7+6gO98l0gA72uouSLBks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708103668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aI2W0/CXxt2Z5lFJjIfLOS3SFEuFXQe3z13S4ExoDO0=;
	b=P2KhdWyn7kKvJDXL66ogEq2pLAbGu6WYwj0Il3+eY0m9cQNJ9VctPScIqyku1yhU2sTto0
	X/sdQYuIrJ0gxOBw==
Date: Fri, 16 Feb 2024 18:14:27 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jikos@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20240216171427.GA9244@kitsune.suse.cz>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
 <20230815183120.0c92a759@gandalf.local.home>
 <2023081641-unstitch-kangaroo-a2c1@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081641-unstitch-kangaroo-a2c1@gregkh>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.28
X-Spamd-Result: default: False [-4.28 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.18)[-0.919];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Hello,

On Wed, Aug 16, 2023 at 04:55:39PM +0200, Greg KH wrote:
> On Tue, Aug 15, 2023 at 06:31:20PM -0400, Steven Rostedt wrote:
> > On Wed, 16 Aug 2023 00:13:56 +0200 (CEST)
> > Jiri Kosina <jikos@kernel.org> wrote:
> > 
> > > > The huge majority of Linux use in the world is Android, everything else
> > > > is a rounding error.   
> > > 
> > > Sorry, but in my view this is a slight oversimplification.
> > 
> > I agree. And that's just taking in "numbers". What about impact. If there's
> > a security flaw in an android phone, it opens up each individual for an
> > attack, but it usually requires an attacker to hit them individually.
> > 
> > But if an enterprise is hit. All it takes is to go after one server, and
> > you have access to thousands of users and their private data.
> > 
> > It's not just the number of installations that count.
> 
> Very true, but as an individual, we regard the private data in our
> phones usually more important than the data stored in corporate systems :)

If my data happens to be on a corporate system I do care about their
security. With everything moving to the cloud today most of the data
users can see on their Android phones is in fact on such a corporate
system.

> Together we were able to solve the "impossible" problem of Android
> kernel security.  Now that that windmill is semi-successfully conquered
> despite many who thought it never could be, why can't we help other
> users of our product to do the same?  If not, we run the risk of having
> Linux be blamed for bad security, when in reality, it's the policy of
> companies not taking advantage of what we are providing them, a nuance
> that Linux users will never really understand, nor should they have to.

The real impossible problem of Android security is that those Android
systems aren't really opensource, and it's (next to) impossible to get
updataes when the device vendor does not provide one.

So many Android device users are running long-obsolete systems because
there is nothing more recent that runs on their device.

That won't change no matter what stable does or does not.

Thanks

Michal

