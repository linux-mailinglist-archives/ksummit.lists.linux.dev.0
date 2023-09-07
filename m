Return-Path: <ksummit+bounces-1081-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BC796E3B
	for <lists@lfdr.de>; Thu,  7 Sep 2023 02:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF591C20AB2
	for <lists@lfdr.de>; Thu,  7 Sep 2023 00:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67144811;
	Thu,  7 Sep 2023 00:53:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03363A
	for <ksummit@lists.linux.dev>; Thu,  7 Sep 2023 00:53:40 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c09673b006so3200585ad.1
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 17:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694048020; x=1694652820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AKqMMT6dQVSur6i1BdUQMoWm/Up/vHd8uoxCxSDMWpo=;
        b=S8vSVsoDP6bXOVjUAWwEXD7149XzplBOaUjo4lv364Opbl62GtM0remlfcDnZTtOGc
         lqzZZExMSMSX2qsLg8JvjC7GeJnHiLzeTcuQLMRRqqIG4wpijyZ9XeCWFGNOhAK7lsqD
         hR4pDVIbOobGXBcC/jtjkiqwz+TKKxiLk5TyQVE49Lortvo7MYIVPOoBI13N5XXdOg2l
         T+yrZ4+o8cvlCgGf5GMtluKVJPL6gbGSQCkRcELk9LOjMirN3UFrPXxiOyvfy0qIrtyJ
         yKZy7jq02YKym4gm42I03z0TrZroZiiD/rUY4skf5Y1gw3mr7fNLlZyGGjOEX9rygDoQ
         Zaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694048020; x=1694652820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKqMMT6dQVSur6i1BdUQMoWm/Up/vHd8uoxCxSDMWpo=;
        b=YijogesoZW+x/jE6vif85ViOnIIX7OuBepO4cVG97HjQqDJt84WHgPr5DfYss96Qma
         ID9DI8xldXXY6iU6+ynfSunUftfPqmzzou0UcjVFaXRpJ9rmoLchKnt/lLlRcg9OfkiC
         pZJiuyaZ2xO95GpL5WlWMSY3+VdOclPhVhx/pVjwm1WqCgQh2ixhwg5zLaj1QnHV2luS
         zCfddm0IH/vK/r/m54Q2l9HFy86t1ZSuYLi/lIwtL6qi642zgVl5T/mCAnpigPsLngNS
         XMzbuOZJh1t0PcpRfqV+rL8m/H8ijD3JlTbQ0qNSsuoWRNfG35cTEshH71SRifDK6ACe
         bzrQ==
X-Gm-Message-State: AOJu0YxqOH8Gj9UiFl3z+5oudt9m9lYoIFmm2YHhl3RZiI8yBdzzc6V6
	xnco1oEScb43IZGS4PU7QO0=
X-Google-Smtp-Source: AGHT+IEPokvBthHtk0nd3O+Fvk4+fQuL6Be7sVEv5R3vcPOBliUL6a2wfNmmoDh9n6kdZJo8KvVA9Q==
X-Received: by 2002:a17:902:6b86:b0:1bc:25ed:374 with SMTP id p6-20020a1709026b8600b001bc25ed0374mr13486534plk.49.1694048019639;
        Wed, 06 Sep 2023 17:53:39 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902eb0600b001b7f40a8959sm11582737plb.76.2023.09.06.17.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 17:53:39 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 247178EC3A75; Thu,  7 Sep 2023 07:53:36 +0700 (WIB)
Date: Thu, 7 Sep 2023 07:53:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dave Chinner <david@fromorbit.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPkfEFTsBOk3iVuQ@debian.me>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/2KGUKOHTI6vRFRa"
Content-Disposition: inline
In-Reply-To: <ZPkDLp0jyteubQhh@dread.disaster.area>


--/2KGUKOHTI6vRFRa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2023 at 08:54:38AM +1000, Dave Chinner wrote:
> There's a bigger policy question around that.
>=20
> I think that if we are going to have filesystems be "community
> maintained" because they have no explicit maintainer, we need some
> kind of standard policy to be applied.
>=20
> I'd argue that the filesystem needs, at minimum, a working mkfs and
> fsck implementation, and that it is supported by fstests so anyone
> changing core infrastructure can simply run fstests against the
> filesystem to smoke test the infrastructure changes they are making.

OK.

>=20
> I'd suggest that syzbot coverage of such filesystems is not desired,
> because nobody is going to be fixing problems related to on-disk
> format verification. All we really care about is that a user can
> read and write to the filesystem without trashing anything.
>=20
> I'd also suggest that we mark filesystem support state via fstype
> flags rather than config options. That way we aren't reliant on
> distros setting config options correctly to include/indicate the
> state of the filesystem implementation. We could also use similar
> flags for indicating deprecation and obsolete state (i.e. pending
> removal) and have code in the high level mount path issue the
> relevant warnings.

Something like xfs v4 format?

>=20
> This method of marking would also allow us to document and implement
> a formal policy for removal of unmaintained and/or obsolete
> filesystems without having to be dependent on distros juggling
> config variables to allow users to continue using deprecated, broken
> and/or obsolete filesystem implementations right up to the point
> where they are removed from the kernel.
>=20
> And let's not forget: removing a filesystem from the kernel is not
> removing end user support for extracting data from old filesystems.
> We have VMs for that - we can run pretty much any kernel ever built
> inside a VM, so users that need to extract data from a really old
> filesystem we no longer support in a modern kernel can simply boot
> up an old distro that did support it and extract the data that way.
>=20
> We need to get away from the idea that we have to support old
> filesystems forever because someone, somewhere might have an old
> disk on the shelf with that filesystem on it and they might plug it
> in one day. If that day ever happens, they can go to the effort of
> booting an era-relevant distro in a VM to extract that data. It
> makes no sense to put an ongoing burden on current development to
> support this sort of rare, niche use case....

This reminds me of me going to a random internet cafe when kids played
popular online games (think of Point Blank), with the computers were
running Windows XP which was almost (and already) EOL, yet these
games still supported it (kudos to game developers).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/2KGUKOHTI6vRFRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPkfDwAKCRD2uYlJVVFO
o1GRAQD1RJ8B8zua+lCxAMfM8owJ9VCSK2cC6RHKeg81aZYkMAEArsRtLwk4rCtk
jFphuj8wxKERZHS5gt1y0glbUxW4sAc=
=zI1E
-----END PGP SIGNATURE-----

--/2KGUKOHTI6vRFRa--

