Return-Path: <ksummit+bounces-2959-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gOoVNVPuT2pKqgIAu9opvQ
	(envelope-from <ksummit+bounces-2959-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:54:11 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1203734955
	for <lists@lfdr.de>; Thu, 09 Jul 2026 20:54:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=T4YToUED;
	dmarc=pass (policy=none) header.from=zytor.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2959-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2959-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A457830C57F4
	for <lists@lfdr.de>; Thu,  9 Jul 2026 18:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0434499A0;
	Thu,  9 Jul 2026 18:50:22 +0000 (UTC)
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61A449990;
	Thu,  9 Jul 2026 18:50:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623022; cv=none; b=SkAxs+2KwIHrzPlnaqAtzbF0xxmz2NAklXeyYFukWPijXPkhtQQ82xwVko6+/VfH7gAfoJW7muGsBhMneDuDqtT7o6p8D+2wwLR76byq2BsSjYix96kXqCyepDOOIDbMoEilomABfiGTKwOu9h9pmsTCCG0J/M/ZB16+190s6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623022; c=relaxed/simple;
	bh=IfsO6HxLTXW01jP0l/n4ICuvMe7UAYdaCLzRWPZgMV4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dik4OHX9J1blVYUQiEGlXPsRrm3Erwiv+ssaLaqXzzwbdhDFLB9Y1wHrL8HAwlExdBofXr3mQbH2h9/YpPbZ5yygab9IvpFeHggaU6WIx+UNH0FTwb5uB/2nDzMjCrT9/jz1e3rIv7Ifc8wVnXNRFTajb7KKKL2EU1Qw59JlxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=T4YToUED; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 669Io8eY2037309
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 9 Jul 2026 11:50:08 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 669Io8eY2037309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783623009;
	bh=N90+Q/WRWSftDB/5SdsiWi0IwQTZffWBvrmgWR+XJK8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=T4YToUEDFZqEJkO5JWsnG1d3HFwRl21ApyiZqsIGcmXRlu0pKt7TAHr8W7+1JVyod
	 +36w2TYXuCc3DL+iaXzEbzYn1lCKAlG/V8VUtrU43uw9BxyZ5DMnI1Bf4iVYBxA0ON
	 r2giBML0X1DD7Y/kR9xDkZ55pzgmXtsNpfyRXa5BLQ2BGFHtwP2zvx3J0WNlsS3VoX
	 sJwjjGPVbGL+m2mX6JoIOc/iXtLy27FV03P4tjJcaGzyI5Mdc/dDWbupwsH71hNRZe
	 RKqvrA4AHlzxTEPic2FB+58ZXWHCRyjI19SsSwzKn1M8uNXzM/ly8wUaPLCOjjmaXF
	 5AtQ8a/jAwRkA==
Date: Thu, 09 Jul 2026 11:50:03 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>,
        ksummit@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [TECH TOPIC] Implementing malloc
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook> <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com> <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com> <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
Message-ID: <AF2564E2-7537-432F-B6A2-4CCE8F746BBC@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2959-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[zytor.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-for-linux.com:url,lists.linux.dev:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zytor.com:from_mime,zytor.com:email,zytor.com:mid,zytor.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1203734955

On July 9, 2026 11:44:11 AM PDT, Miguel Ojeda <miguel=2Eojeda=2Esandonis@gm=
ail=2Ecom> wrote:
>On Thu, Jul 9, 2026 at 8:18=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=2Ecom>=
 wrote:
>>
>> In case it was not obvious, my comment was meant to be ironic (reductio=
 ad absurdum)=2E
>
>Ok, I appreciate the clarification and that you consider it the right cal=
l then=2E
>
>> In fact, I'm surprised and worried to hear how recent this was=2E This =
underscores my main concern with Rust, which is that it seems to have *very=
* different stability criteria than the C code, where we are not allowed to=
 require anything that hasn't been in gcc for 5-10 years, after which the c=
lang people discover they never implemented it and so they ask for another =
5+ years of keeping the old-syle or fallback code=2E
>
>Hmm=2E=2E=2E What is the concern? If it is about the window of supported
>compilers, the current policy is to follow Debian Stable's version as
>the minimum=2E
>
>  https://rust-for-linux=2Ecom/rust-version-policy#minimum-upgrade-policy
>
>It was openly discussed and finally decided in the Maintainers Summit=2E
>
>As things mature and we get the improvements we want, we may want to
>extend it to two Debian Stables etc=2E
>
>But please note that, regarding allocators, we could have moved
>earlier=2E As I mentioned, we waited as long as we could to see if
>upstream could give us what we needed=2E It didn't happen, so we
>pivoted, but we could have done it earlier=2E
>
>Cheers,
>Miguel
>

All of the above=2E It has been a concern of mine for a very long time=2E=
=20

It's a really big asymmetry versus the C side, and at some point someone i=
s going to want to implement a core subsystem in Rust=2E

"Two Debian stable" is a blink of an eye in comparison with the stability =
criteria that people are demanding for gcc/binutils=2E

