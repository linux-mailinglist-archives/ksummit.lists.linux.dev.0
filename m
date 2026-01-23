Return-Path: <ksummit+bounces-2803-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LGFGLCpc2nOxwAAu9opvQ
	(envelope-from <ksummit+bounces-2803-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:02:40 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0878BF3
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0D1C301F9C3
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE016274B23;
	Fri, 23 Jan 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="W6qj4wNr"
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79DE3A1C9
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187745; cv=pass; b=ddZybX9VvfwvJ7V1F05WkxUpZb/4xpVvhkpRWhw94x/hHYoBaHX0uNwwiJt5R5AS2e6+lUKY3XiUP6hbbetsQW8d2zz/VttqK9AFbevM8Ud197SCCjQG/vY/hn7A8A3/18nN4vdCPIXnJAafiA/9uhPGkY+ymw2iK5/U9jL/P5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187745; c=relaxed/simple;
	bh=3xW18q4fqifFThB2HJQsLeOSogXstpaMB3rW9T9EPAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie93Jwuz+BOIRxi4IGevn2qzCeWNQ7u4K3zIcRxGNss3c55aSeRq1l7zEk+yemWGNWVBonN2ArYJgVeQlxlQXuTpELuLGVxT2MGSOMsnYLIIZTKnK7dfQ1T5JRoAxgQkosWzJflpVw5wiJc35DlUsnarVYofWsxiQHnblzaRHis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=W6qj4wNr; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8230d228372so1050651b3a.1
        for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 09:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769187743; cv=none;
        d=google.com; s=arc-20240605;
        b=gJ1U02uLptHOi6GmxbvDWGjoxy/YGxaQvlCtE++zgKKM7LxTxpt1cKHmsiabPnbK18
         y8IJJBIGShUXzY4wkRrLgq7bzht4dF04o5AqWmrqBD4jiPE5y+GyS63YCwISXCNsV/Yy
         ghQpYu8jHVzt8IX9QmMEJ2p8yAZmocNlEYch+qFkTWQFG7+6UFtO/SyJsua7s/90EnmL
         EfKS8Jp9qWYeNon6/wCqojzRL5h8Ai8WdTjgDUtQgixdMj+9yHdkN2SFBXMD2NbFvOkv
         TmNLqI7rnOnZ8nPaixRoJnEZCbqMAbkK1lLT3tv74xyPWVvF/R3byO1qdL1gL0JuENHP
         xjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbjCiTEAZbXzffExN0XfNVlLkho12ju0K4Wb4j38RJ0=;
        fh=7l3fPM3IvAug5/YmHnTq9aeJ5xFhYa54AVGJ5fZ7Ne4=;
        b=H2SZsl0HhTcx2Dme5ywHuqjTv+AjMoTut+lFOj/nrhM+ddHcTcHLBIV4rTEwoVToRy
         1ZaTWbUwnKQ9cxyzM+RmluEbuVVhsPavgl6YDV/t+RpNOVXHLbhZrzckfyJKB4V94J0T
         kON7v/2UIqoEH34hQR/USBNHcSZ55dFIm1tBuMxFbcTNr6EL/sq844IOHjeFRH/Y4Syf
         p2AJivbp69CdhVC+mdQaqT1V7w41z/NBPp6ZKbPDW6FNOKa3U8H5SOzf7WucraSKgtng
         CVeLnWFxLfl/wcnd5pwuCBp+dRmJKKCOlxBECDRcUdghhHRyHSkY22Ftoyg6Z7w4Fza2
         KM0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1769187743; x=1769792543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbjCiTEAZbXzffExN0XfNVlLkho12ju0K4Wb4j38RJ0=;
        b=W6qj4wNr8HJA0eXRYlev5gBJ4AhsEc43gmw6ByW7XEjgNqPvw9cMn/HF0WXmJ0X63T
         dpaNXgysC4ITHMVo8ddN/0v2mETbLRKXH4AXnThdRtzLaM24GUnukZZv4RzD91adt+02
         qHGVcZgrCUHFPzD1OUnI338L7UFVsbky9PP3/rCYYjAyY+nwJI31rwvgpgFHjeV6qUDr
         /vu2TvtCIWs2tAxqiYycECAe8CftoFiFWbJ6yanncaBBMAw3z313/iFrVTMlCS0VfPmP
         VjyQcBLU7PWj3d5bu58CUuI2NfVYUBj4SwpVWzb+GZV0/R9cYLeCBt4k5/Cw4DPd9ADS
         eZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187743; x=1769792543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbjCiTEAZbXzffExN0XfNVlLkho12ju0K4Wb4j38RJ0=;
        b=JdpT8+Mb4FxE+34kd09aeOjvXZggOHIap7nqeCLKWjwj+GoFi7uHhiQQZcyeKS8Q1Y
         vruEk9DcWXCeNYA2a7/KOUMdjh2O+vNX8lHcRN1FnT8SADAUe5O4MT6jE+GXCBoKltui
         l3FVZg/dqaXMXs+zse8AA3CNE7UJ2R28eHP5v9JYUElcnFsUgW/8RBKjxP2jGzoV0BXQ
         /PvImSMwD3O0n1zgp3MfN/0bOSeGLzwtGgcXs0hIOKO999wCefPudlurOrtG+e7lNz3f
         GxDabcm7QVLg450kq2eyMiGVuIxZAYObQEKtcCfeA1kyAoDJs3wLLHuixmIP/GHFzm3M
         ldSg==
X-Forwarded-Encrypted: i=1; AJvYcCWN7GovZfH+y5A3uH0qG7CdhPKNMK564+iffrSJ2jVbng9USwlwxQs3oh/xt5UBECPMQICTcW+h@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7RmVVSM5pOZEf6hMKTv6IXV+fe7GxmwGIVNnl0KBhEarq3DMz
	ce2faa6Z2/1My1iQ/pA0hu6t/ea55XOPA1oH2bkCGJcyB0UhiVun0nQ8hunkIC+85GdZR/L1HXT
	D73ZbUgj7si9Ku59MHUFbNhGxVXSafHPp9I0I2nSF
X-Gm-Gg: AZuq6aIHc3koDxIHlsE8yFo55Zsn8WJw/GtJebUgWz/TtIlF8kxR4sidhYllym/YMBS
	xA4JZmTCUs/ZJB1AzF83LCvqn6Ecq9GhLTJUFbqFBUagHjcbvast10CdymG2rMNWlDT8iZ0ODx6
	Vr+EkgeuV3W9ZcsGd7APjM1kbhQp/VoeMvyF5jLrNgvizmd8QSJRS569HEIxaGp0nQoYBwgCa5P
	hI7ludiq6jP5I/eIBxes6crhJ/ZRuJmjTewEs7reNFjKrtP9/q/HPAf6fUxTdzSPmBiFb4=
X-Received: by 2002:a05:6a20:9190:b0:384:d09f:f610 with SMTP id
 adf61e73a8af0-38e772ccdb4mr1835215637.32.1769187742683; Fri, 23 Jan 2026
 09:02:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org> <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com> <20260123-hallowed-catfish-of-pizza-bde94f@lemur>
In-Reply-To: <20260123-hallowed-catfish-of-pizza-bde94f@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 23 Jan 2026 12:02:10 -0500
X-Gm-Features: AZwV_QhUt66I0NdvcTyB47-is0y5qL5GOcACoYO5Ph78iJ4BklwIremb0GPYOfk
Message-ID: <CAHC9VhRwMpSCphW_FsHojX1r12D5MOMUBm6MAzpGYD_FDjEVtA@mail.gmail.com>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
To: Greg KH <gregkh@linuxfoundation.org>, Konstantin Ryabitsev <mricon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,paul-moore.com:url,paul-moore.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2803-lists=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[paul-moore.com:+]
X-Rspamd-Queue-Id: B6E0878BF3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:38=E2=80=AFAM Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
> On Fri, Jan 23, 2026 at 11:24:33AM -0500, James Bottomley wrote:
> > > There will be a presentation about this in February at a conference
> > > and hopefully it will be made public then as the work is still
> > > ongoing.
> >
> > Could you please stop doing this?  The Open Source norm is to release
> > early and often and long before you have stable code so you get
> > feedback incorporated *before* you're committed to something.
>
> I will provide this feedback to them when we meet in a week. It's not the=
 LF
> itself who are writing this code, but a bunch of security devs funded by
> OpenSSF and they *are* closely working with me and Greg during the initia=
l
> iteration to make sure that what they come up with is actually going to b=
e
> suitable and well-received by the kernel community (like, don't write it =
in
> nodejs or something).
>
> So, I'd say we're doing it right -- write the initial tool based on the
> requirements provided by some key users, then release the 0.1 for broader=
 use
> and do iterative development based on feedback.

Based on the comments above, it sounds like there have been at least
some requirements/design discussions already, were those on a public
list?  Perhaps they were and I simply missed it (always a real
possibility), but based on the other reactions in this thread I don't
believe that is the case.

I don't believe I'm alone when I say that I have a "complicated"
relationship with the LF; a large part of that is due to what I would
call a delayed transparency, of which this seems like it might be a
good example.  If the LF is sponsoring a project/effort that somehow
involves the community, why is the kickoff not public?  Why are other
community members not involved in establishing a list of requirements,
or participating in the design discussions?

--=20
paul-moore.com

