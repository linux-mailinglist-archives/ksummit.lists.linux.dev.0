Return-Path: <ksummit+bounces-1210-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF68584EF
	for <lists@lfdr.de>; Fri, 16 Feb 2024 19:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 502A81C21324
	for <lists@lfdr.de>; Fri, 16 Feb 2024 18:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800921339B8;
	Fri, 16 Feb 2024 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cG6kn+aa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="13dGOgz0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cG6kn+aa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="13dGOgz0"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF8132472
	for <ksummit@lists.linux.dev>; Fri, 16 Feb 2024 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708107192; cv=none; b=j4U6g3XYUdnShlV0KTmgDomguKjBt6W54sKAgqp8NW6sC9y9LGOn/KIxHzrLmFED0frZCggUheOEpJW8hVyDMzFLreEaCU0PYfFP810Hc0mYmG4Yby5f+wxyMfqV28Ynpat/6D9du8oYTaiJaeHXHyoeeqmeF7LOpMXpaZBjyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708107192; c=relaxed/simple;
	bh=3eX8qglLpCiylxOOo2WOskj8BBpot8UcwuUIg8zKvZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmZhgSDfPkDEkncio3MtmXjIR3ox/XU7gM7L2EpboRbbl3hA1wasSTYuy6z54nuQ4mq0cnOd+gHFr7oA9+sPiFTeB0Z8NskyP7400gHUMSqZSkyTR+jPC/ar0ibdRbnRxzeFg9Ys7aqWCsD10qD0ih2dz/UVJJwAamPyxttXNxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cG6kn+aa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=13dGOgz0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cG6kn+aa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=13dGOgz0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 38ACC1F832;
	Fri, 16 Feb 2024 18:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708107188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lg41BalrWB+U1hsdlS2rNEf6CY/CVKM14Y1Ex/RARk=;
	b=cG6kn+aaqcOjr9XtbcJe7TCQL/Rn1SPTSRRDAugWUa4ebeDJGPoGRfW/70C2PP5YblNE/W
	Z1LFHLLksIB8gr82B2WojMFquUAOdbfTnYd1SQUc+nWth0HFmyGSEbnfmd4Iyt796tdT6Q
	sq4kLF/sctkHnmYlZH9rMVc9RAM3Pdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708107188;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lg41BalrWB+U1hsdlS2rNEf6CY/CVKM14Y1Ex/RARk=;
	b=13dGOgz0+pZM1eRF6YhtkhLtr7pP2gyPnVNMsD65gvMlVN1X06vJtNmozD7QEC7zRy5djD
	vgdQ0Vb91czqDTBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708107188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lg41BalrWB+U1hsdlS2rNEf6CY/CVKM14Y1Ex/RARk=;
	b=cG6kn+aaqcOjr9XtbcJe7TCQL/Rn1SPTSRRDAugWUa4ebeDJGPoGRfW/70C2PP5YblNE/W
	Z1LFHLLksIB8gr82B2WojMFquUAOdbfTnYd1SQUc+nWth0HFmyGSEbnfmd4Iyt796tdT6Q
	sq4kLF/sctkHnmYlZH9rMVc9RAM3Pdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708107188;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lg41BalrWB+U1hsdlS2rNEf6CY/CVKM14Y1Ex/RARk=;
	b=13dGOgz0+pZM1eRF6YhtkhLtr7pP2gyPnVNMsD65gvMlVN1X06vJtNmozD7QEC7zRy5djD
	vgdQ0Vb91czqDTBQ==
Date: Fri, 16 Feb 2024 19:13:07 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jikos@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
Message-ID: <20240216181307.GW9696@kitsune.suse.cz>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm>
 <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com>
 <2023081515-lake-spotty-6a3a@gregkh>
 <20230815084253.7091083e@gandalf.local.home>
 <2023081540-vindicate-caterer-33c6@gregkh>
 <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
 <20230815183120.0c92a759@gandalf.local.home>
 <2023081641-unstitch-kangaroo-a2c1@gregkh>
 <20240216171427.GA9244@kitsune.suse.cz>
 <2024021634-starlit-waviness-c329@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024021634-starlit-waviness-c329@gregkh>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.34
X-Spamd-Result: default: False [1.34 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(2.44)[0.814];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[30.70%]
X-Spam-Flag: NO

On Fri, Feb 16, 2024 at 06:34:37PM +0100, Greg KH wrote:
> On Fri, Feb 16, 2024 at 06:14:27PM +0100, Michal Suchánek wrote:
> > On Wed, Aug 16, 2023 at 04:55:39PM +0200, Greg KH wrote:
> 
> That was a very old thread, why dig it up now?

It was linked to recently and I did not realize how old it is.

> > > Together we were able to solve the "impossible" problem of Android
> > > kernel security.  Now that that windmill is semi-successfully conquered
> > > despite many who thought it never could be, why can't we help other
> > > users of our product to do the same?  If not, we run the risk of having
> > > Linux be blamed for bad security, when in reality, it's the policy of
> > > companies not taking advantage of what we are providing them, a nuance
> > > that Linux users will never really understand, nor should they have to.
> > 
> > The real impossible problem of Android security is that those Android
> > systems aren't really opensource, and it's (next to) impossible to get
> > updataes when the device vendor does not provide one.
> > 
> > So many Android device users are running long-obsolete systems because
> > there is nothing more recent that runs on their device.
> > 
> > That won't change no matter what stable does or does not.
> 
> That is why governments are making laws to require this to happen.  The
> EU just did this for all mobile devices, and I expect other governments
> to do the same over time.

Indeed, with the requirement to ship updates for several years, and the
CRA requirement to not ship broken updates things may improve, at least
it looks so on paper.

Thanks

Michal

