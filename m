Return-Path: <ksummit+bounces-1079-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F599796E32
	for <lists@lfdr.de>; Thu,  7 Sep 2023 02:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694A11C20AA0
	for <lists@lfdr.de>; Thu,  7 Sep 2023 00:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94979811;
	Thu,  7 Sep 2023 00:46:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098563A
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 00:46:22 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf57366ccdso11078715ad.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 17:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694047582; x=1694652382; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=57AXZJo8Jb4yjf847g3y+DgEAO9Dl3SA1ttEwigOllQ=;
        b=bVLIfNQgHL/qpSlweojC2+x62ubtPp2gn8HJ6k1NwrACPOzY6rFENiARfpRYqMWfhB
         9LT/UTMGKMGeCrI2C2hwSNqp47v1bPsnMqic9nKh5tQLbO9l4rLQFFsW69J/NnHIWZbO
         fkTXEDe7ie5qmU5UvcqXteOxyd+IMl8GxGUGy/3dHYEdzNzsXQi2W+IwSAFiPWffXoBo
         oH/p7ybVJs4NZyWxGuxU4MejiFw2vJg7FeKgU3TPTD8ShdxiemGkTEUGqranItTdZ3h8
         ZamW5FexNCSMFgdzlFW5WwCCcpcD0loVwaT1b3oqjNwl9KVtv3yPWFxMfLwYXQhvo0jw
         9b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694047582; x=1694652382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57AXZJo8Jb4yjf847g3y+DgEAO9Dl3SA1ttEwigOllQ=;
        b=F97K5RK26CiqY02rx6c//AZEaXl3ef1CJC339MPjbaBqAqpdxhQMQnPSEU4kgHEXQJ
         2kSp5bcA7CPDoLoNggRbw7B4/offrAf5yqx6aBhDtGBM38rvA6+HSYbwS4dxLUCa1RjH
         KNu9y19qwXLSyPPAAcNW22f4DlFyMXUteG+UwP2Al5nywLx4ZrWQ8BCnYvMcJh7TTBON
         rbOLnh+lrQTg8loshpuGWGtaA/Qe1RBC1njQhiz68lxr+1zMxxbzQN6hpevewh4l4S1U
         hOInv1B15GWlO8E7jHXcx4stdq1guBRZKywgSobEX/i0rptwVxYrz2wBXqXEFRkMBMDt
         vweg==
X-Gm-Message-State: AOJu0Yyw05lcEc8wV//RJMtLgsnCutBhDGwu56f0pkdUgCTdEwKY3ntf
	ovVUQlk13mndPm87xq8Nllo=
X-Google-Smtp-Source: AGHT+IGEshBV6LanzKkBw8uAV7S2uZK+tdl1sD5PiG2+b+JzII9K8RkucdgWdnRLDs6fkkw53Ayklg==
X-Received: by 2002:a17:902:da91:b0:1bd:f69e:a407 with SMTP id j17-20020a170902da9100b001bdf69ea407mr1884708plx.8.1694047582161;
        Wed, 06 Sep 2023 17:46:22 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902ee8500b001bd62419744sm11582778pld.147.2023.09.06.17.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 17:46:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id AD5FD8CEA49C; Thu,  7 Sep 2023 07:46:18 +0700 (WIB)
Date: Thu, 7 Sep 2023 07:46:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Dave Chinner <david@fromorbit.com>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPkdWd8Ihq7D7gjN@debian.me>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qbvKeCXYr1773C4"
Content-Disposition: inline
In-Reply-To: <ZPe4aqbEuQ7xxJnj@casper.infradead.org>


--4qbvKeCXYr1773C4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[disclaimer: I'm no expert here, just my opinion]

On Wed, Sep 06, 2023 at 12:23:22AM +0100, Matthew Wilcox wrote:
> I really feel we're between a rock and a hard place with our unmaintained
> filesystems.  They have users who care passionately, but not the ability
> to maintain them.

In OTW: these fses are in limbo state, which induces another question:
how to get users of these into developers (and possibly maintainers)
to get out of this unfortunate situation? Do we have to keep
deprecated APIs they use indefinitely for the sake of servicing them without
any transition plan to replacement APIs? Do akpm have to step in for that to
happen?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--4qbvKeCXYr1773C4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPkdUQAKCRD2uYlJVVFO
o/wyAQCltgShWt21XAnulgTA3k24PPQGghH2nW9zWxcXoTqJ2gD/aoeg4+SBzTiU
vVUsoqmLmR/ddK9ZveVTugdKEhXIxwA=
=M0u8
-----END PGP SIGNATURE-----

--4qbvKeCXYr1773C4--

