Return-Path: <ksummit+bounces-2891-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAudEnUjrWkGywEAu9opvQ
	(envelope-from <ksummit+bounces-2891-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 08 Mar 2026 08:21:25 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E622EE8E
	for <lists@lfdr.de>; Sun, 08 Mar 2026 08:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C1C300D919
	for <lists@lfdr.de>; Sun,  8 Mar 2026 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F1F332EBA;
	Sun,  8 Mar 2026 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUWbkaeA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3634617A2EA
	for <ksummit@lists.linux.dev>; Sun,  8 Mar 2026 07:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772954482; cv=none; b=q+fFTa+eNRsSxKK14ps2HofhzJmCf7rO6+RRkLcMxQp36qX4t684LOMOdX9CS8CXKppmVpc7srcY4XRlQVMVsg+pneXCpo2PE34zInY+uZ2gpzE9GN+YKi4n5HaeLWe0M0i56iVkdtThM63KYi9qIOkeFddNJT2s86wy1L36T64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772954482; c=relaxed/simple;
	bh=aWoMRDB2Nw3q20V2kcIj5+rBJl8KAtOx1S8t7HGwJL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dM7uystdgr5ZOI77YlkAZ/T322jgc6kjVVYQQVRWzi1cwyABzge/jaPPGB+TL+72uuJL+XpSw+b+O35WBJXgX/zWSjkMc0n4QIiV2p8VkNgEELhdPPYDouf41TWLyvsT/cemQsYIR6J5OXlN9yio+p7J3SP7AjD1/ByKrs9XZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUWbkaeA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D6EC116C6;
	Sun,  8 Mar 2026 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772954481;
	bh=aWoMRDB2Nw3q20V2kcIj5+rBJl8KAtOx1S8t7HGwJL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lUWbkaeAcmes8uIkPP6L5rpB9yhJ/6ifFlUVdKk/mm9jMoH/5TW4Ayi1fe20TET3Q
	 xFoKLPn7z1Zy1HDDSjsT+8qK9AoomOvZci+14mFi+2oS9IXE29YTqX/oW4l9mTH4B7
	 KuCRST/5nbx0OYDLIqaeaL7FkGLc/+XXdF0AiYNeFIVLisk9onbecO7lTW3CD/yqMF
	 qX+FBe2H69Jq8XDLBo79yC/3cIUr34pghSS6gShqvfYfr1k5hkZQe0GSiGZGIsQKz/
	 zvLD206zbB24YFXQA0ORE0vTmJjZUr+NZ5h13e48SsChpo2yIgB9heZPUlG3rlRR81
	 IbXTxA4O75dEA==
Message-ID: <3dd58b76-7461-4e8b-9dc6-a936a41d8faa@kernel.org>
Date: Sun, 8 Mar 2026 08:21:12 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <2026012340-cannot-spud-5d46@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SK43T7JPQyarnYlQJksG19LP"
X-Rspamd-Queue-Id: 9B6E622EE8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2891-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ukleinek@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SK43T7JPQyarnYlQJksG19LP
Content-Type: multipart/mixed; boundary="------------QkbO1pA6tLaAxQPZqNnB90r0";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
Message-ID: <3dd58b76-7461-4e8b-9dc6-a936a41d8faa@kernel.org>
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
In-Reply-To: <2026012340-cannot-spud-5d46@gregkh>

--------------QkbO1pA6tLaAxQPZqNnB90r0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On 1/23/26 10:29, Greg KH wrote:
> On Fri, Jan 23, 2026 at 10:19:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> On 12/10/25 05:48, Konstantin Ryabitsev wrote:
>>> ## Web of Trust work
>>>
>>> There is an ongoing work to replace our home-grown web of trust solut=
ion (that
>>> does work but has important bottlenecks and scaling limitations) with=

>>> something both more distributed and easier to maintain. We're working=
 with
>>> OpenSSF to design the framework and I hope to present it to the commu=
nity in
>>> the next few months.
>>
>> the current home-grown solution is https://git.kernel.org/pub/scm/docs=
/kernel/pgpkeys.git/, right?
>>
>> I wonder what the bottlenecks and scaling limitations are that you men=
tion.
>>
>> Is there some info available already now about the path you (and OpenS=
SF) intend to propose?
>=20
> There will be a presentation about this in February at a conference and=

> hopefully it will be made public then as the work is still ongoing.

The event was
https://lfms26.sched.com/event/2ETT5/the-first-person-linux-kernel-mainta=
iner-verification-project-greg-kroah-hartman-linux-kernel-maintainer-dani=
ela-barbosa-lf-decentralized-trust-glenn-gore-affinidi
, right?

I don't find a way to profit from what was presented there, do you know
if there is video coverage? Or is there other material about the
proposal?

Best regards
Uwe

--------------QkbO1pA6tLaAxQPZqNnB90r0--

--------------SK43T7JPQyarnYlQJksG19LP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmtI2kACgkQj4D7WH0S
/k7+twf/ZpKX7s/EBATvSu5zNIPYaRVm4jVfMv8iy3txZdIOT0TPg4ToQRsGy0s7
KtThorJY81AJs+gFgQpDPHzX0bqQFOkkVmporywQ3pzKJD54gPIoNhlwjkpPCfay
eVtC0fO5f9QtTixeRhaY2s5CgPmoVAU4zcSzrQiMvgG7Rth+4cYlWgGGRyyaD67t
8Rf/lI1iWdj21km8T/zIFCzW84z/mk25VVU2nDNNsZgsn5pkuubP308TQ8zMVePN
BiZWa39c7g+bCQ2AyXpQcd6f6ny2c9O796+zRjZkftRnoAODsa4zHVcsYWj/Bzvk
O753boU/N6YzD1Uid6BIkAmTJj/asg==
=k6d6
-----END PGP SIGNATURE-----

--------------SK43T7JPQyarnYlQJksG19LP--

