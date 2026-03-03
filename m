Return-Path: <ksummit+bounces-2880-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEDxIiPepmnRXwAAu9opvQ
	(envelope-from <ksummit+bounces-2880-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 14:12:03 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E65041EFFA8
	for <lists@lfdr.de>; Tue, 03 Mar 2026 14:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83FD230C30C7
	for <lists@lfdr.de>; Tue,  3 Mar 2026 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70FD425CCD;
	Tue,  3 Mar 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZSb1qXfb"
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C8333F8BE
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543328; cv=none; b=O8Prlnhkua0TChBfp8IkGA6n4yaJbQOrVXMvywkMf8pygBRscuHSk41ivih8DLDZTw55mz6Ol/m8woaabytnV2oau384pZDuhWgVdghLjUtNk+YYjYaIFZADs7jq04ywWCDAI+UHtl7EjyecQyoUtwhtc+8A1MPBxxyRjUxW/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543328; c=relaxed/simple;
	bh=Mh9RR334CHZyv+6AMWHyIbizM88auQYqKR+XgMvWDr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCPzxu/6ht9k7mTE++vbyEmumRU4b/MvyohUSThAUGOak91blWUSUL+EfAi+HkzoKe8htWEowZB2+Y8VulK3gUWQrmJqUn68bWpAd9bZkcI995WIx3MLhafos2Cud2abrQG99RvA6rRoxKy8WL2tkjkq+mRfOe91Y5PN6kwhesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZSb1qXfb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b935b8dcab7so872718366b.1
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 05:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772543325; x=1773148125; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mh9RR334CHZyv+6AMWHyIbizM88auQYqKR+XgMvWDr0=;
        b=ZSb1qXfb+qf7CXtHKwG0D7uUDgBtGukM1nVgPKHga7hu78rLArshmzNbJekzSYtf19
         RSYXCzf6XbfvTidF023RHp5hvCPrPD3cux1uAfo7r+Kd0k2dkhr2vFndpwPJPh/8Bwla
         5vsdvYBJ3toc65ebMeEFNXxCQwQPrvOjZpCiQFGlaFFPeIhGqsz4Gfzi+r1RN5lJm0si
         TQ26IAfoppvQUeUc5k98laCQwnvuxkX+xJwlqWfg+LqaeUKPZUi0yezjXyEL3QXU/8rc
         2LO6zOeFsrs3nheJ8GmX1hsUvwxmidshh8UBkPrSJa6HKACNE5NNnGErCfgdcuKlgwTH
         LHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543325; x=1773148125;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh9RR334CHZyv+6AMWHyIbizM88auQYqKR+XgMvWDr0=;
        b=T6jlI6iv46MlNUSi7cdnihMHHqMlBcEjfXOBOgNcf2eNiX7C/jcI1oKCBAL/py58Hx
         UOb1CjAE/AaRk90eaiyT9b/U5dbaLo0GWxDtTF22BTf+NU4f+hfn10jUPX5bN3yTCBk0
         td1hK24GF3KSH4cwjdE8EcVmWN+JzGvK6ItFhs7OOKFF7JbGHBISzlH5k5yMZAv4uftW
         fG6o637BQqNBYSGMShBVpV6frLLca3DSZ9ON32lNX1f9J6meWWBolprrueC9q7HGcxEM
         J8Jugt9r7W+CHGFdvrhPIQoQq/jsH3e6UpWKc4UN7hB8eh/8LVKU0y/oOO6LesmnFs8v
         4c/g==
X-Forwarded-Encrypted: i=1; AJvYcCW7qG8yqvxe2sp+Pwzz9t7d3Hlpct9KVzPjhBdCr7jOBVtcdx9qk+a93tGexFZeTmNQZJvMXsXU@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7+BtoFc6sDkiOZUCEQ2kdUPLCUZIHIdXh298KuxrVF/UK2Cxz
	jOQaSPPFB7LWFPNp82FlVdA8vCO95sLMNWESQGqii+wXfv4vhfcx5sY5/hpQzIKJRtY=
X-Gm-Gg: ATEYQzwIGO6gqYRAoqQTFuavwKNLgvhAbt/eON7kE+M3LSOjAIT1M9DOOn9fvGcD6jH
	dr9rV98QvscbaNI3IB70Jpg8zggwHzsELoRMRxkDu4MZZ6DbAjjvxt206ETVBauaEIlHwKHOjbt
	8MZYl+DlzUcossUQPQE0nQoaYET0Da3OZVn9Fx37mUHjTrPD++rxbiXSwcd8hDVweWxcXAzLXCo
	IbIA739ZnHJRb0N1EZP4jQFGi7QT17u17xKVvyhIZQYWhZ/VjUSIioqmc4RAVMBdPehrpSZUNBj
	O4q0pWjiOGR8aWnX9xUvkza1eaxltMYtnXd1ZDtEf21741siNu7EaeaV/X6YBnh7ufdC5tG2y0H
	KlVm0Af9mLd7QywvCDUwl1LZVA4e69jv1rOGIuniUpdiQN81ksoRq7PHikp3/FSQZxEofuhBTKG
	3XjtBmXgqobZP8cfidt9jiAiHAm+n1t4cQ/rpoQbZBs+WVWci57okSKXv974OZGO7RDSRSDVGFi
	4+ladBNF+TfpuUrXGz1ZWoJ1T/Kpjmjl+BJWzFf3gj6uzfPFFMB3Q==
X-Received: by 2002:a17:907:9692:b0:b90:77bb:5aea with SMTP id a640c23a62f3a-b9376540714mr1132605566b.43.1772543324531;
        Tue, 03 Mar 2026 05:08:44 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6132asm598940266b.32.2026.03.03.05.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:08:44 -0800 (PST)
Message-ID: <0c0064d6-eda5-4e94-8546-9b605fa327df@suse.com>
Date: Tue, 3 Mar 2026 14:08:43 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Sasha Levin <sashal@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 ksummit <ksummit@lists.linux.dev>,
 laurent pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Steven Rostedt
 <rostedt@goodmis.org>, users <users@kernel.org>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
 <CAMuHMdXevwo-dgURJimDJrrfgt108v9TR=P1fq6N5P36egz4tA@mail.gmail.com>
 <10bef54e-eb0c-4ed3-84ca-4e393449e974@kernel.org> <aabYZSvpilnJxETk@laps>
 <5c6e89540a55521f622f820e92ef370e82e285f4.camel@HansenPartnership.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <5c6e89540a55521f622f820e92ef370e82e285f4.camel@HansenPartnership.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mC3TjIy6HsRxkBMlUhv2kmHR"
X-Rspamd-Queue-Id: E65041EFFA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.39 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2880-lists=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:dkim,suse.com:mid,nod.at:email]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mC3TjIy6HsRxkBMlUhv2kmHR
Content-Type: multipart/mixed; boundary="------------f7xoaWFE10lSfgKeuh0BuRCT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Sasha Levin <sashal@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 ksummit <ksummit@lists.linux.dev>,
 laurent pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Steven Rostedt
 <rostedt@goodmis.org>, users <users@kernel.org>
Message-ID: <0c0064d6-eda5-4e94-8546-9b605fa327df@suse.com>
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <91334269.1714.1772519173246.JavaMail.zimbra@nod.at>
 <CAMuHMdXevwo-dgURJimDJrrfgt108v9TR=P1fq6N5P36egz4tA@mail.gmail.com>
 <10bef54e-eb0c-4ed3-84ca-4e393449e974@kernel.org> <aabYZSvpilnJxETk@laps>
 <5c6e89540a55521f622f820e92ef370e82e285f4.camel@HansenPartnership.com>
In-Reply-To: <5c6e89540a55521f622f820e92ef370e82e285f4.camel@HansenPartnership.com>

--------------f7xoaWFE10lSfgKeuh0BuRCT
Content-Type: multipart/mixed; boundary="------------o1skK9hdmPCjlgc9D2DKMgnH"

--------------o1skK9hdmPCjlgc9D2DKMgnH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDMuMjYgMTM6NTgsIEphbWVzIEJvdHRvbWxleSB3cm90ZToNCj4gT24gVHVlLCAy
MDI2LTAzLTAzIGF0IDA3OjQ3IC0wNTAwLCBTYXNoYSBMZXZpbiB3cm90ZToNCj4+IE9uIFR1
ZSwgTWFyIDAzLCAyMDI2IGF0IDEwOjMxOjQ2QU0gKzAxMDAsIEppcmkgU2xhYnkgd3JvdGU6
DQo+Pj4gT24gMDMuIDAzLiAyNiwgOToxMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
Pj4+PiBPbiBUdWUsIDMgTWFyIDIwMjYgYXQgMDc6MjYsIFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+DQo+Pj4+IHdyb3RlOg0KPj4+Pj4+IFZvbjogIlNhc2hhIExldmlu
IiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+Pj4+Pj4gQWRkIENPTkZJR19LQUxMU1lNU19MSU5F
SU5GTywgd2hpY2ggZW1iZWRzIGEgY29tcGFjdCBhZGRyZXNzLQ0KPj4+Pj4+IHRvLWxpbmUN
Cj4+Pj4+PiBsb29rdXAgdGFibGUgaW4gdGhlIGtlcm5lbCBpbWFnZSBzbyBzdGFjayB0cmFj
ZXMgZGlyZWN0bHkNCj4+Pj4+PiBwcmludCBzb3VyY2UNCj4+Pj4+PiBmaWxlIGFuZCBsaW5l
IG51bWJlciBpbmZvcm1hdGlvbjoNCj4+Pj4NCj4+Pj4+PiBNZW1vcnkgZm9vdHByaW50IG1l
YXN1cmVkIHdpdGggYSBzaW1wbGUgS1ZNIGd1ZXN0IHg4Nl82NA0KPj4+Pj4+IGNvbmZpZzoN
Cj4+Pj4+Pg0KPj4+Pj4+ICDCoFRhYmxlOiA0LDU5Nyw1ODMgZW50cmllcyBmcm9tIDQsODQx
IHNvdXJjZSBmaWxlcw0KPj4+Pj4+ICDCoMKgIGxpbmVpbmZvX2FkZHJzW13CoMKgwqDCoCA0
LDU5Nyw1ODMgeCB1MzLCoCA9IDE3LjUgTWlCDQo+Pj4+Pj4gIMKgwqAgbGluZWluZm9fZmls
ZV9pZHNbXcKgIDQsNTk3LDU4MyB4IHUxNsKgID3CoCA4LjggTWlCDQo+Pj4+Pj4gIMKgwqAg
bGluZWluZm9fbGluZXNbXcKgwqDCoMKgIDQsNTk3LDU4MyB4IHUzMsKgID0gMTcuNSBNaUIN
Cj4+Pj4+PiAgwqDCoCBmaWxlX29mZnNldHMgKyBmaWxlbmFtZXPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB+wqAgMC4xIE1pQg0KPj4+Pj4+ICDCoMKgIFRvdGFsIC5yb2RhdGEgaW5j
cmVhc2U6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfiA0NC4wIE1pQg0KPj4+Pj4+DQo+
Pj4+Pj4gIMKgdm1saW51eCAoc3RyaXBwZWQpOsKgIDUyOSBNaUIgLT4gNTczIE1pQsKgICgr
NDQgTWlCIC8gKzguMyUpDQo+Pj4+Pg0KPj4+Pj4gSG0sIHRoYXQncyBhIHNpZ25pZmljYW50
IGluY3JlYXNlLg0KPj4+Pg0KPj4+PiBPdGhlciByYW5kb20gaWRlYTogdGhpcyBkYXRhIGlz
IG9ubHkgbmVlZGVkIGluIGNhc2Ugb2YgYSBjcmFzaC4NCj4+Pj4gUGVyaGFwcyBpdCBjYW4g
YmUgc3RvcmVkIGNvbXByZXNzZWQsIGFuZCBvbmx5IGJlIGRlY29tcHJlc3NlZA0KPj4+PiB3
aGVuIG5lZWRlZCwgb3IgZXZlbiBkdXJpbmcgbG9vay11cD8NCj4+Pg0KPj4+IEJ1dCBvYnZp
b3VzbHkgbm90IHdoZW4gZHVtcGluZyBPT00gc3RhY2sgdHJhY2VzIDpQLg0KPj4NCj4+IFJp
Z2h0IC0gSSByZWFsbHkgd2FudGVkIHRvIGF2b2lkIG1lbW9yeSBhbGxvY2F0aW9ucyBvciBk
aXNrIEkvTyBoZXJlLg0KPj4NCj4+IEknbSBzdXJlIHdlIGNhbiBjb21lIHVwIHdpdGggbW9y
ZSBlZmZpY2llbnQgd2F5cyB0byBzdG9yZSB0aGlzDQo+PiBpbmZvcm1hdGlvbiAtIEkgd2Fu
dGVkIHRvIGtlZXAgdGhlIGluaXRpYWwgdmVyc2lvbiBzaW1wbGUgYW5kIGVhc3kNCj4+IGZv
ciByZXZpZXcuDQo+IA0KPiBXaGVuIHRoZSBzeXN0ZW0gaXMgY3Jhc2hpbmcsIGVmZmljaWVu
Y3kgKGF0IGxlYXN0IGFzIGxvbmcgYXMgdGhlIHVzZXINCj4gZG9lc24ndCBub3RpY2UpIGlz
bid0IHR5cGljYWxseSByZXF1aXJlZCwgc28gaWYgeW91IGRpZCBhIGxpbmVhciBzZWFyY2gN
Cj4gaW5zdGVhZCBvZiBhIGJpbmFyeSBvbmUgeW91IGNvdWxkIHVzZSBjb21wcmVzc2VkIGRh
dGEgdGhhdCdzIGFtZW5hYmxlDQo+IHRvIGRlY29tcHJlc3Npb24gdXNpbmcgYSBzdHJlYW0g
YWxnb3JpdGhtIChpLmUuIG9ubHkgcmVxdWlyZXMgYSBmaXhlZA0KPiBsZW5ndGggYnVmZmVy
LCBub3QgZGVjb21wcmVzc2lvbiBvZiB0aGUgZW50aXJlIHRoaW5nKSwgdGhlbiB5b3Ugc3Ry
ZWFtDQo+IHRocm91Z2ggdGhlIGNvbXByZXNzZWQgZGF0YSBhIGNodW5rIGF0IGEgdGltZSBs
b29raW5nIGZvciB0aGUgbWF0Y2guDQoNCkFuZCBmb3IgdGhpcyBkYXRhIHRoZSBjb21wcmVz
c2lvbiBhbGdvcml0aG0gY291bGQgYmUgcXVpdGUgc2ltcGxlOg0KDQpCdWlsZCBjaHVua3Mg
b2YgZS5nLiAxMDAwIGVudHJpZXMsIGFsbG93aW5nIHRvIGRvIGEgcXVpY2sgc2VhcmNoIGZv
cg0KZmluZGluZyB0aGUgY29ycmVjdCBjaHVuaywgdGhlbiBzY2FuIHRocm91Z2ggdGhlIGNo
dW5rIHRvIGZpbmQgdGhlDQplbnRyeS4NCg0KUHV0IHRoZSBzdGFydCBhZGRyZXNzIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgZWFjaCBjaHVuaywgdGhlbiB1c2UgYSBsc2IxMjgNCmNvZGVkIG9m
ZnNldCBmb3IgZWFjaCBlbnRyeSAob2Zmc2V0IGFsd2F5cyByZWxhdGl2ZSB0byBsYXN0IGVu
dHJ5LCBzbw0KbW9zdCBlbnRyaWVzIHdvdWxkIG5lZWQgb25seSAxIGJ5dGUgYWRkaXRpb25h
bCBhZGRyZXNzIGluZm9ybWF0aW9uKS4NCg0KSSBndWVzcyBmaWxlIGlkcyBhcmUgZmluZSBh
cyB1MTYuDQoNCkxpbmUgbnVtYmVycyBjb3VsZCBiZSBsc2IxMjggZW5jb2RlZCwgdG9vLCBs
aW1pdGluZyBtb3N0IGVudHJpZXMgdG8NCjIgYnl0ZXMgb2YgYWRkaXRpb25hbCBpbmZvcm1h
dGlvbi4NCg0KVGhpcyBzaW1wbGUgc2NoZW1lIHdvdWxkIGFscmVhZHkgc2F2ZSByb3VnaGx5
IDUwJSBvZiB0aGUgbmVlZGVkIHNwYWNlLg0KDQoNCkp1ZXJnZW4NCg==
--------------o1skK9hdmPCjlgc9D2DKMgnH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------o1skK9hdmPCjlgc9D2DKMgnH--

--------------f7xoaWFE10lSfgKeuh0BuRCT--

--------------mC3TjIy6HsRxkBMlUhv2kmHR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmm3VsFAwAAAAAACgkQsN6d1ii/Ey+5
4gf/ZFTPqzhBQ1qGxniQX1BOPxJ5/Xbi2Gu5etZAQMxKdDg50OTW/7Yn9Wq4SDENW0gngQ5adGiv
G4OHrjXGZKxlW8oq9jPI+V8rMJTT/4R00Cl/mWYsH2r0PIkDpxhHTGT3+72WLzKt0Vn5fMqNmJKN
TvnTU3jSa7wMRe4+R5oFmFHQk5bAqAhYX1Oy5wwxIpprAZJuaTB3xcse8gugCpi2QxvRpqkg4z8u
CUPzHJp1W18iuDuJA2LY1QQcoj6GNYckPPyWHbEFRadwVUrQahZt3wv64coJa2YOt/W/y8gQNs+F
kfgag14uFeTj5k8jErS7UwVUy311uTCE1r8SSsVcSA==
=Fhg1
-----END PGP SIGNATURE-----

--------------mC3TjIy6HsRxkBMlUhv2kmHR--

