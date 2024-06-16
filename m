Return-Path: <ksummit+bounces-1298-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34338909D25
	for <lists@lfdr.de>; Sun, 16 Jun 2024 13:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD0B1C20982
	for <lists@lfdr.de>; Sun, 16 Jun 2024 11:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB28186E3F;
	Sun, 16 Jun 2024 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMHWOg3V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QLrJqOQO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMHWOg3V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QLrJqOQO"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EC6A008
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718537950; cv=none; b=VFUI1vhe18jmBMs/YRXtiEoWs2HJJ09onRif/ldJlkcD7dbHZjRMSECzWI6/+sWyZ0+dcssy3nqQMmcTu84vxZrsQD9trzaJlEhQ7hjlJneQWfRJFR186b2IB0GPECcmWmKdHKsLaSO262l8CBputQMXitR0ozwWMgdWBNNTato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718537950; c=relaxed/simple;
	bh=nVqk2/u0LluyS/sQ1FO/b7ySRGJNCejpORWv5pgl+JM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+NcBYl4jNlLW22VVvww9A7uPPuQzEutVStOgueWX9B/nFcbjX0CFeh2qUfEkeGwtLHdg4KHmKLxJYpjuKzjJpEPmzsLiVk3q2YTV0FbJj/raVxaawO+w0Hh9KSb1MWiR52AyTCx5UiPHuHIuSeZ6QUpuGMPisdKB7uasTUSJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EMHWOg3V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QLrJqOQO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EMHWOg3V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QLrJqOQO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 953FB22DD0;
	Sun, 16 Jun 2024 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718537940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJSUWRM5bOuc9Xmx+FnG9z2zIvOYJWYl3AfDLgfsevs=;
	b=EMHWOg3Vo7t+mKKer9OF4zMl+pxhshMrP6PqPsOwLCun9UFC38rnlzjcCnx4UXxqYN9DGn
	tXvcDHDv2K2ayLY2U6o3IHoik1kyqiXL6jGHHNwD7J3unn24ZEmCcdi9N3ZQI0mF96eOsC
	Bw5S6jl4ALgf+JAIBN6/DveRH3VTDSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718537940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJSUWRM5bOuc9Xmx+FnG9z2zIvOYJWYl3AfDLgfsevs=;
	b=QLrJqOQOvz5Hn+gLQ1hBiKzO2+G4ay521oVmFDPt3O03NxzQEaL7DkOKLZrvPXZMZNdWUJ
	yAunESl0oj+v1ICA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718537940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJSUWRM5bOuc9Xmx+FnG9z2zIvOYJWYl3AfDLgfsevs=;
	b=EMHWOg3Vo7t+mKKer9OF4zMl+pxhshMrP6PqPsOwLCun9UFC38rnlzjcCnx4UXxqYN9DGn
	tXvcDHDv2K2ayLY2U6o3IHoik1kyqiXL6jGHHNwD7J3unn24ZEmCcdi9N3ZQI0mF96eOsC
	Bw5S6jl4ALgf+JAIBN6/DveRH3VTDSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718537940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NJSUWRM5bOuc9Xmx+FnG9z2zIvOYJWYl3AfDLgfsevs=;
	b=QLrJqOQOvz5Hn+gLQ1hBiKzO2+G4ay521oVmFDPt3O03NxzQEaL7DkOKLZrvPXZMZNdWUJ
	yAunESl0oj+v1ICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A92C13AA0;
	Sun, 16 Jun 2024 11:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zqtzENTObmbLPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 16 Jun 2024 11:39:00 +0000
Date: Sun, 16 Jun 2024 13:39:25 +0200
Message-ID: <875xu95d76.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin"
 <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent backports of commits that turn out to cause regressions
In-Reply-To: <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	<20240613095917.eeplayyfvl6un56y@quack3>
	<20240613-rustling-chirpy-skua-d7e6cb@meerkat>
	<87plsjoax6.fsf@mail.lhotse>
	<CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
	<70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]

On Sun, 16 Jun 2024 10:10:25 +0200,
Paolo Bonzini wrote:
> 
> On 6/16/24 03:13, Linus Torvalds wrote:
> > And no, I'm not at all happy with the fact that apparently vhost and
> > kvm has made it their thing.
> > 
> > Paolo, Michael, Takashi, please put useful links, not those braindead
> > message id's in your commit messages.
> 
> Ok, ok.  Before lore existed, there was no service that I can remember
> that archived messages with a message-id in the URL.  So, for example
> Gmane links would be useless now, and patchwork links are not really
> something I'd trust for long-term archival either.
> 
> These days, it's mostly just that I have set am.message-id to true
> years ago; but since lore is managed by kernel.org, we can expect the
> URLs to be stable and the original reason to use Message-ID is
> obsolete.  Having learnt right now about the applypatch-msg git hook,
> I've stuck a
> 
> sed -i -e 's,^Message-ID: <\(.*\)>$,Link:
> https://lore.kernel.org/r/\1,' "$1"
> 
> in there which should do the trick.  I guess Michael and Takashi can
> do the same. :)

Heh, that's actually what I've done already, but my script had
"Message-Id" or such to match and it didn't hit any longer after some
mail change; as a result, Message-id tag remained.  You'd better to
make it case-insensitive match.


HTH,

Takashi

