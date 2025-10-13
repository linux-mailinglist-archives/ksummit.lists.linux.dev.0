Return-Path: <ksummit+bounces-2513-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1CBD64EA
	for <lists@lfdr.de>; Mon, 13 Oct 2025 23:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 942794F4BB5
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733D42F0671;
	Mon, 13 Oct 2025 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rutF6eWY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aSLyP+It";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rutF6eWY";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="aSLyP+It"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896FE2EE5FD
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 20:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389179; cv=none; b=RE1t6G7hCq0lAd3VjQ7rumYR/H2NXq7YnFc4iLWrZow0eRBdilqBmIwDdSB38mW+Q3xoWz3l5esaQBOCygVsIcgbHl+BjVaa7DYxyBTHTt1nKk6MfdOiC6PRLKdiUF4R57awAn+a7PCL5FDnjxvOK8umiCx+yXzvA4dw8Omt1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389179; c=relaxed/simple;
	bh=MC8v+NNPO8UaNrpNK1Zxr619gX4SrqiPV0lpgW9FPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8e98Fg0nkPnvxojFuLajJs8ESaLpN1NAJjMHMF+ihIItIF7mqeLCV5uMwxsBBIrHfJO+swrbH/R/SRRuTdE9XucPRzfWJhSK+0eVG7sA+aFTqic07ixnER/HD4cmzXtgkDKuQh+HqjloUafG2wzcZZduf/VrndEyyITY3Gwrts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rutF6eWY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aSLyP+It; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rutF6eWY; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=aSLyP+It; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49E0722074;
	Mon, 13 Oct 2025 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760389175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xlEvpyolFLr0g88KAful3NUEZum2WQyeb/HXbc/qQ3U=;
	b=rutF6eWYI3YlFVxFCVf/bttBD+iUZG9Bj3QnTkUVumd8+I3oDX52HO5LWuciU8Du/kouAk
	j8eoyTSOs6As7w7CqxHtqgHY/PmjYckx2vuYKTzLNh+HHzXTHPysVoFkrPyT+Q80PO1Kw7
	UbMnQTktRR2rTa9o3sNEx7JdGenWgOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760389175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xlEvpyolFLr0g88KAful3NUEZum2WQyeb/HXbc/qQ3U=;
	b=aSLyP+ItWeUGWk7+LqSPt+RonG8YR1VuM1jJ/AVGWsddBG17I8ETIHQ9fWY9P2PU0RpzNR
	Ge3ekZoqUTUThOAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=rutF6eWY;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=aSLyP+It
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760389175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xlEvpyolFLr0g88KAful3NUEZum2WQyeb/HXbc/qQ3U=;
	b=rutF6eWYI3YlFVxFCVf/bttBD+iUZG9Bj3QnTkUVumd8+I3oDX52HO5LWuciU8Du/kouAk
	j8eoyTSOs6As7w7CqxHtqgHY/PmjYckx2vuYKTzLNh+HHzXTHPysVoFkrPyT+Q80PO1Kw7
	UbMnQTktRR2rTa9o3sNEx7JdGenWgOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760389175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xlEvpyolFLr0g88KAful3NUEZum2WQyeb/HXbc/qQ3U=;
	b=aSLyP+ItWeUGWk7+LqSPt+RonG8YR1VuM1jJ/AVGWsddBG17I8ETIHQ9fWY9P2PU0RpzNR
	Ge3ekZoqUTUThOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38F181374A;
	Mon, 13 Oct 2025 20:59:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wtOTDTdo7WhEEQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 13 Oct 2025 20:59:35 +0000
Message-ID: <18e3d34e-6608-403e-8b85-4873858e9788@suse.cz>
Date: Mon, 13 Oct 2025 22:59:34 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
 Steven Rostedt <rostedt@goodmis.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 49E0722074
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[zytor.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:mid,suse.cz:dkim,linux-foundation.org:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,zytor.com:email,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On 10/13/25 22:34, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 13, 2025 at 12:20 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Mon, 13 Oct 2025 at 12:07, H. Peter Anvin <hpa@zytor.com> wrote:
>> >
>> > This was the *original* definition that I proposed, which was vetoed by Linus because it didn't provide a clickable experience.
>>
>> Yeah., I still don't believe that Message-ID is any better than a link.
>>
>> And the only believable argument *for* this all is the "one-click experience".
>>
>> Because I still believe that "if you use tools, then 'b4 dig' is
>> better than *any* pointless tag that just is entirely redundant and
>> only cuts down on the available information".
>>
>> So the one-click argument actually resonates with me, even if that is
>> very obviously not the workflow I use. At least I *understand* that
>> argument.
>>
>> All the other arguments seem just disingenuous in that they literally
>> give less useful information than "b4 dig" does.
> 
> Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
> yet. ...but I searched and it was easy to find a reference. I'll check
> it out. Oh, it's using AI. I guess my suggestion that we should use AI
> to solve this problem was more on point than I realized. ;-) ;-) ;-)
> 
> OK, I found Sasha's RFC [1].

You found the wrong one. See this one:

https://lore.kernel.org/all/20251010-muscular-camel-of-acumen-00eeaf@lemur/

But if your point was to demonstrate how searching for a subject can lead to
the wrong outcome, good job :)

> The first thing I note is that "b4 dig" takes a Message-Id as an
> argument. So now I'm confused. I must be misunderstanding the problem
> we're trying to solve with the "Link:" tag?!
> 
> From how I've used it, the "Link" tag allows you to start with a
> commit hash in Linux and then go from there to a mailing list post
> (and/or Message-Id). ...and then it was suggested that we don't need a
> "Link" tag (or anything containing "Message-Id") because "b4 dig"
> solves the problem. ...but then "b4 dig" needs a Message-Id to work?
> Eh?
> 
> [1] https://lore.kernel.org/all/20250909163214.3241191-1-sashal@kernel.org/
> 
> -Doug
> 


